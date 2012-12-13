class Comment < ActiveRecord::Base
  attr_accessible :content, :quote, :user

  belongs_to :quote, counter_cache: true
  belongs_to :user

  validates_presence_of :content, :quote

  scope :recent, order("created_at DESC")
end