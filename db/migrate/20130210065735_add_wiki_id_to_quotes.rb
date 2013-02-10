class AddWikiIdToQuotes < ActiveRecord::Migration
  def change
    rename_column :quotes, :name, :author
    add_column :quotes, :source_wiki_id, :integer
    add_column :quotes, :author_wiki_id, :integer
    add_index :quotes, :source_wiki_id
    add_index :quotes, :author_wiki_id
  end
end
