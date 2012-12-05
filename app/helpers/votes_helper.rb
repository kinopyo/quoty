module VotesHelper
  def vote_class(score, quote)
    return unless current_user

    vote = current_user.votes.where(quote_id: quote).first
    return unless vote

    return 'active' if score == :up && vote.score == 1
    return 'active' if score == :down && vote.score == -1
  end
end
