class VotesController < ApplicationController
  before_filter :require_login

  def create
    @vote = current_user.votes.new
    @vote.quote = Quote.find(params[:quote_id])
    render 'votes/update_votes'
  end

  def destroy
    @vote = Vote.find(params[:id])
    @vote.destroy
    render 'votes/update_votes'
  end
end
