class VotesController < ApplicationController
  before_filter :require_login

  def vote
    quote = Quote.find(params[:quote_id])
    @vote = current_user.votes.where(quote_id: quote).first
    if @vote
      @vote.destroy
    else
      score = params[:score] == 'up' ? 1 : -1
      @vote = current_user.votes.create!(quote: quote, score: score)
    end
  end

  private

  def require_login_message
    "To vote a quote you need to login."
  end
end
