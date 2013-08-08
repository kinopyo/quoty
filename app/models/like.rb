class Like < ActiveRecord::Base
  include PublicActivity::Model
  tracked owner: :user, recipient: proc {|c, m| m.quote.user }, only: [:create], params: {
    summary: proc { |c, m| c && c.truncate(m.quote.content, length: 30) }
  }

  belongs_to :quote, touch: true, counter_cache: true
  belongs_to :user

  scope :recent, -> { order(created_at: :desc) }
end
