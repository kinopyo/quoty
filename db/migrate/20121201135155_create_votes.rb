class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.integer :user_id
      t.integer :quote_id
      t.integer :score

      t.timestamps
    end
  end
end
