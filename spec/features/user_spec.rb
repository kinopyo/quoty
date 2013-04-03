require 'spec_helper'

describe 'User' do
  it 'create an account and login', js: true do
    visit login_path
    click_link 'Create an account'
    fill_in 'identity_name', with: 'alice'
    fill_in 'identity_email', with: 'alice@example.com'
    fill_in 'identity_password', with: '1234567'
    fill_in 'identity_password_confirmation', with: '1234567'
    click_button 'Sign up'
    page.should have_content('Signed in')

    click_link 'alice'
    click_link 'Sign out'
    click_link 'Sign in'
    fill_in 'auth_key', with: 'alice@example.com'
    fill_in 'password', with: '1234567'
    click_button 'Login'
    page.should have_content('Signed in')
  end
end
