class AddCommentsCountToQuote < ActiveRecord::Migration
  def change
    add_column :quotes, :comments_count, :integer, default: 0
  end
end
