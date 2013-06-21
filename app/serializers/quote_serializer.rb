class QuoteSerializer < ActiveModel::Serializer
  attributes :id, :author, :content, :source, :language, :context
end
