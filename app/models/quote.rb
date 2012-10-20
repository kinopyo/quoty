class Quote < ActiveRecord::Base
  attr_accessible :content, :language, :name, :source

  belongs_to :user

  validates :content, presence: true
end
