class AddLikesCountToQuote < ActiveRecord::Migration
  def change
    add_column :quotes, :likes_count, :integer, default: 0
  end
end
