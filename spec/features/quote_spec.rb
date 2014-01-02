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

  it "user sees English quotes by default" do
    ja_quote = create(:quote, content: '日本語の名言')
    en_quote = create(:quote, content: 'English quote')
    visit quotes_path

    expect(page).to     have_content(en_quote.content)
    expect(page).not_to have_content(ja_quote.content)
  end

  it 'user sees Japanese quotes when visiting /ja/quotes' do
    ja_quote = create(:quote, content: '日本語の名言')
    en_quote = create(:quote, content: 'English quote')
    visit quotes_path(locale: :ja)

    expect(page).to     have_content(ja_quote.content)
    expect(page).not_to have_content(en_quote.content)
  end
end
