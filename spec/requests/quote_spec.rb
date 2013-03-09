require 'spec_helper'

describe 'Quote' do
  it 'create a quote' do
    login
    visit new_quote_path
    fill_in 'quote_content', with: 'my quote'
    fill_in 'quote_author', with: 'the author'
    click_button 'Create'
    page.should have_content('my quote')
  end

  # TODO refactor to a helper method
  def login
    visit login_path
    click_link 'Create an account'
    fill_in 'identity_name', with: 'alice'
    fill_in 'identity_email', with: 'alice@example.com'
    fill_in 'identity_password', with: '1234567'
    fill_in 'identity_password_confirmation', with: '1234567'
    click_button 'Sign up'
    page.should have_content('Signed in')
  end
end
