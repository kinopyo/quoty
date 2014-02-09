require 'spec_helper'

describe 'User' do
  background do
    OmniAuth.config.test_mode = false
  end

  it 'creates an account with email & password' do
    visit login_path
    click_link 'Create an account'
    fill_in 'identity_name', with: 'alice'
    fill_in 'identity_email', with: 'alice@example.com'
    fill_in 'identity_password', with: '1234567'
    fill_in 'identity_password_confirmation', with: '1234567'
    click_button 'Sign up'
    page.should have_content('Signed in')
  end

  it 'logs in' do
    # TODO move this to factory_girl
    identity = Identity.create(name: 'alice', email: 'alice@example.com',
        password: '1234567', password_confirmation: '1234567')
    user = create(:user)
    Provider.new.tap { |p| p.user = user; p.identity = identity; p.save }

    visit login_path
    fill_in 'auth_key', with: 'alice@example.com'
    fill_in 'password', with: '1234567'
    click_button 'Login'
    page.should have_content('Signed in')
  end
end
