class QuoteSerializer < ActiveModel::Serializer
  attributes :id, :author, :content, :source, :language, :context, :created_at
  has_one :user, key: :creator, serializer: UserShortSerializer

  def created_at
    object.created_at.to_time.iso8601
  end
end
