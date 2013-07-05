class Photo < ActiveRecord::Base
  belongs_to :quote

  mount_uploader :file, PhotoUploader
end
