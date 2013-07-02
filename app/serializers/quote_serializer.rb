class QuoteSerializer < ActiveModel::Serializer
  cached

  attributes :id, :author, :content, :source, :language, :context, :created_at
  has_one :user, key: :creator, serializer: UserShortSerializer
  has_many :photos, key: :images, serializer: PhotoSerializer

  def created_at
    object.created_at.to_time.iso8601
  end

  def cache_key
    object
  end
end
