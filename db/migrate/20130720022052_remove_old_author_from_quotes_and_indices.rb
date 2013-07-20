class RemoveOldAuthorFromQuotesAndIndices < ActiveRecord::Migration
  def change
    remove_column :quotes, :old_author, :string
    remove_index :quotes, column: :author_wiki_id
  end
end
