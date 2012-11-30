class Bookmark < ActiveRecord::Base
  belongs_to :user
  belongs_to :quote
  validates :quote_id, uniqueness: { scope: :user_id }
end
