module VotesHelper
  def vote_class(score, quote)
    # use in-memory find to avoid N+1 queries
    vote = quote.votes.select {|v| v.user == current_user}.first
    return unless vote

    return 'active' if score == :up && vote.score == 1
    return 'active' if score == :down && vote.score == -1
  end
end
