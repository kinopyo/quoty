class CreateLikes < ActiveRecord::Migration
  def change
    create_table :likes do |t|
      t.references :quote, index: true
      t.references :user, index: true
      t.integer :vote_id
      t.timestamps
    end
  end
end
