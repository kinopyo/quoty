module VotesHelper
  def vote_class(score, vote)
    # use in-memory find to avoid N+1 queries
    return unless vote

    return 'active' if score == :up && vote.score == 1
    return 'active' if score == :down && vote.score == -1
  end
end
