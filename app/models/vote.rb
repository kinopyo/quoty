class Vote < ActiveRecord::Base
  include PublicActivity::Model
  tracked owner: :user, recipient: proc {|c, m| m.quote.user }, only: [:create], params: {
    summary: proc { |c, m| c && c.truncate(m.quote.content, length: 30) }
  }

  has_one :like

  belongs_to :quote, touch: true
  belongs_to :user

  scope :recent, -> { order(created_at: :desc) }

  def down_vote?
    score == -1
  end
end
