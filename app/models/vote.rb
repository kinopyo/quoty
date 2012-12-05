class Vote < ActiveRecord::Base
  belongs_to :quote
  belongs_to :user
  attr_accessible :score, :quote

  after_create :update_score
  after_destroy :update_score

  private

  def update_score
    quote.score = quote.votes.sum(score)
    quote.save!
  end
end
