class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.references :user
      t.references :quote
      t.text :content

      t.timestamps
    end
    add_index :comments, :user_id
    add_index :comments, :quote_id
  end
end
