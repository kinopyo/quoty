class Vote < ActiveRecord::Base
  include PublicActivity::Model
  tracked owner: :user, recipient: proc {|c, m| m.quote.user }, only: [:create], params: {
    summary: proc { |c, m| c.truncate(m.quote.content, length: 30) }
  }

  belongs_to :quote, touch: true
  belongs_to :user

  def down_vote?
    score == -1
  end
end
