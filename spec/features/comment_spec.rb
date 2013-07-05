require 'spec_helper'

describe 'Comment' do
  it 'user posts a comment' do
    login
    quote = create(:quote)
    visit quote_path(quote)
    fill_in 'comment_content', with: 'my comment'
    click_button 'Post'
    page.should have_content('my comment')
  end
end
