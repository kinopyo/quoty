class VotesController < ApplicationController
  before_filter :require_login

  def create
    @quote = Quote.find(params[:quote_id])
    if @quote.my_vote.present?
      @quote.my_vote.destroy
    end
    @vote = current_user.votes.new
    @vote.quote = Quote.find(params[:quote_id])
    if params[:score] == "up"
      @vote.score = 1
    elsif params[:score] == "down"
      @vote.score = -1
    end
    @vote.save!
    @vote.quote.update_score
    render 'votes/update_votes'
  end

  def destroy
    @vote = Vote.find(params[:id])
    @quote = @vote.quote
    @vote.destroy
    @quote.update_score
    render 'votes/update_votes'
  end
end
