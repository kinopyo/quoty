require 'spec_helper'

describe Api::V1::QuotesController do
  describe '#index' do
    it 'returns collection of quotes json' do
      quote = create(:quote)
      get :index, format: :json

      response.body.should be_json([
        'id' => quote.id,
        'content' => quote.content,
        'author' => quote.author,
        'source' => quote.source,
        'language' => quote.language,
        'context' => quote.context,
      ])
    end
  end

  describe '#show' do
    it 'returns single quote json' do
      quote = create(:quote)
      get :show, id: quote.id, format: :json

      response.body.should be_json(
        'id' => quote.id,
        'content' => quote.content,
        'author' => quote.author,
        'source' => quote.source,
        'language' => quote.language,
        'context' => quote.context,
      )
    end
  end
end
