require 'spec_helper'

describe 'Session' do
  it 'User register with twitter' do
    visit root_path
    click_link 'Login'
    click_link 'Login with Twitter'
    expect(page).to have_content('Signed in!')
  end
end
