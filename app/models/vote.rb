class Vote < ActiveRecord::Base
  include PublicActivity::Model
  tracked owner: :user, recipient: proc {|c, m| m.quote.user }, only: [:create], params: {
    summary: proc { |c, m| c.truncate(m.quote.content, length: 30) }
  }

  belongs_to :quote
  belongs_to :user
  attr_accessible :score, :quote

  after_create :update_score
  after_destroy :update_score

  def down_vote?
    score == -1
  end

  private

  def update_score
    quote.score = quote.votes.sum(score)
    quote.save!
  end
end
