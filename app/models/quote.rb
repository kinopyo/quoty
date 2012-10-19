class Quote < ActiveRecord::Base
  attr_accessible :content, :language, :name, :source

  validates :content, presence: true
end
