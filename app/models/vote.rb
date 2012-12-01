class Vote < ActiveRecord::Base
  belongs_to :quote
  belongs_to :user
  attr_accessible :direction
end
