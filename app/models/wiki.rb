class Wiki < ActiveRecord::Base
  attr_accessible :ancestry, :description, :title

  belongs_to :user

  validates :title, presence: true
end
