class PhotoSerializer < ActiveModel::Serializer
  attributes :id, :image_url, :thumb_url

  def image_url
    object.file_url
  end

  def thumb_url
    object.file.thumb.url
  end
end
