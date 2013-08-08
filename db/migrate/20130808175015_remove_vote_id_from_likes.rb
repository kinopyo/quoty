class RemoveVoteIdFromLikes < ActiveRecord::Migration
  def change
    remove_column :likes, :vote_id, :integer
  end
end
