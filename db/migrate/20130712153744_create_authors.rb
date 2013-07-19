class CreateAuthors < ActiveRecord::Migration
  def change
    create_table :authors do |t|
      t.string :name
      t.text :profile
      t.integer :quotes_count, default: 0

      t.timestamps
    end
  end
end
