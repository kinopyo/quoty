class UserShortSerializer < ActiveModel::Serializer
  attributes :id, :name, :avatar_url

  def avatar_url
    UserAvatarUrl.new(object).url
  end
end
