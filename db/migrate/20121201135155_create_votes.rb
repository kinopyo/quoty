class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.integer :user_id
      t.integer :quote_id
      t.integer :direction

      t.timestamps
    end
  end
end
