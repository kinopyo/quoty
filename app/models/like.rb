class Like < ActiveRecord::Base
  belongs_to :quote, touch: true, counter_cache: true
  belongs_to :user
  belongs_to :vote

  scope :recent, -> { order(created_at: :desc) }
end
