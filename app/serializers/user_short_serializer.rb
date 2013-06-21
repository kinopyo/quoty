class UserShortSerializer < ActiveModel::Serializer
  attributes :id, :name, :avatar_url

  def avatar_url
    'TODO'
  end
end
