require 'spec_helper'

describe 'Quote' do
  it 'user posts a quote' do
    login
    visit new_quote_path
    fill_in 'quote_content', with: 'my quote'
    fill_in 'quote_author_name', with: 'the author'
    fill_in 'quote_source', with: 'book'
    click_button 'Create'
    page.should have_content('my quote')
    page.should have_content('the author')
    page.should have_content('book')
  end

  it 'user edits a quote' do
    quote = create(:quote)
    login(quote.user)
    visit edit_quote_path(quote)
    fill_in 'quote_author_name', with: 'new author'
    click_button 'Update'
    page.should have_content('new author')
  end
end
