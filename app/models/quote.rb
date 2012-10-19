class Quote < ActiveRecord::Base
  attr_accessible :content, :language, :name, :source

  validate :content, presence: true
end
