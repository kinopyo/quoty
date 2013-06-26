require 'spec_helper'

describe Api::V1::QuotesController do
  describe '#index' do
    it 'returns collection of quotes json' do
      quote = create(:quote)
      get :index, format: :json

      response.body.should be_json([
        quote_json(quote)
      ])
    end
  end

  describe '#show' do
    it 'returns single quote json' do
      quote = create(:quote_with_photos, photos_count: 2)
      get :show, id: quote.id, format: :json

      response.body.should be_json(
        quote_json(quote)
      )
    end
  end

  def quote_json(quote)
    json = {
      'id' => quote.id,
      'content' => quote.content,
      'author' => quote.author,
      'source' => quote.source,
      'language' => quote.language,
      'context' => quote.context,
      'created_at' => quote.created_at.to_time.iso8601,
      'creator' => {
        'id' => quote.user.id,
        'name' => quote.user.name,
        'avatar_url' => UserAvatarUrl.new(quote.user).url,
      }
    }

    photos = quote.photos.map do |photo|
      {
        'id'        => photo.id,
        'image_url' => photo.file_url,
        'thumb_url' => photo.file.thumb.url
      }
    end

    json.merge('images' => photos)
  end
end
