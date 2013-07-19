class RenameAuthorFromQuotes < ActiveRecord::Migration
  def change
    rename_column :quotes, :author, :old_author
  end
end
