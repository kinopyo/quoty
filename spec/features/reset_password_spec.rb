require 'spec_helper'

describe 'ResetPassword' do
  context 'When valid user' do
    it 'emails user when requesting password reset' do
      user = create(:user)
      visit login_path
      click_link 'Forget your password?'
      fill_in 'reset_password_email', with: user.email
      click_button 'Continue'
      page.should have_content('Email sent')
      ActionMailer::Base.deliveries.should be_present
      last_email.to.should include(user.email)
    end
  end

  context 'When invalid user' do
    it 'does not send email when requesting password reset' do
      visit login_path
      click_link 'Forget your password?'
      fill_in 'reset_password_email', with: 'invalid@example.com'
      click_button 'Continue'
      page.should have_content('Email sent')
      last_email.should be_nil
    end
  end

  context 'When reset token not expired' do
    it 'updates the user password' do
      user = create(:user, reset_password_token: 'something', reset_password_sent_at: 1.hour.ago)
      identity = create(:identity, email: user.email)
      visit edit_reset_password_path(user.reset_password_token)
      fill_in 'identity_password', with: '1234567'
      fill_in 'identity_password_confirmation', with: '111111'
      click_button 'Continue'
      page.should have_content("doesn't match Password")
      fill_in 'identity_password', with: '1234567'
      fill_in 'identity_password_confirmation', with: '1234567'
      click_button 'Continue'
      page.should have_content('Password has been reset')
      page.should have_css('.navbar', text: user.name)
    end
  end

  context 'When token has expired' do
    it 'reports when password token has expired' do
      user = create(:user, :reset_password_token => "something", :reset_password_sent_at => 5.hour.ago)
      visit edit_reset_password_path(user.reset_password_token)
      fill_in 'identity_password', with: '1234567'
      fill_in 'identity_password_confirmation', with: '1234567'
      click_button 'Continue'
      page.should have_content('Password reset has expired')
    end
  end

  context 'When token is invalid' do
    it "raises record not found" do
      expect {
        visit edit_reset_password_path('invalid token')
      }.to raise_error(ActiveRecord::RecordNotFound)
    end
  end
end
