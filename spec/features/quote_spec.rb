require 'spec_helper'

describe 'Quote' do
  it 'user posts a quote'  do
    login
    visit new_quote_path
    fill_in 'quote_content', with: 'my quote'
    fill_in 'quote_author', with: 'the author'
    click_button 'Create'
    page.should have_content('my quote')
  end
end
