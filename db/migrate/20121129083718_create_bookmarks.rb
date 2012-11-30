class CreateBookmarks < ActiveRecord::Migration
  def change
    create_table :bookmarks do |t|
      t.references :user
      t.references :quote

      t.timestamps
    end
    add_index :bookmarks, :user_id
    add_index :bookmarks, :quote_id
  end
end
