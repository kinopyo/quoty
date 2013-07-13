require 'spec_helper'

describe Quote do
  describe '#author_name=' do
    it 'set find and set author_id if author_id is not changed' do
      quote = Quote.new
      author = stub_model(Author)
      Author.should_receive(:find_or_create_author).with('foo').and_return(author)

      quote.author_name = 'foo'

      expect(quote.author_id).to eq(author.id)
    end

    it 'does nothing if author_id is already changed' do
      quote = Quote.new
      quote.author_id = 1
      quote.author_name = 'foo'

      Author.should_not_receive(:find_or_create_author)

      expect(quote.author_id).to eq(1)
    end
  end
end
