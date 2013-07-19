class AddAuthorIdToQuotes < ActiveRecord::Migration
  def change
    add_column :quotes, :author_id, :integer
    add_index :quotes, :author_id
  end
end
