class QuoteSerializer < ActiveModel::Serializer
  attributes :id, :author, :content, :source, :language, :context, :created_at

  def created_at
    object.created_at.to_time.iso8601
  end
end
