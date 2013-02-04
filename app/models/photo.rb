class Photo < ActiveRecord::Base
  attr_accessible :file, :file_cache, :remove_file
  belongs_to :quote

  mount_uploader :file, PhotoUploader
end
