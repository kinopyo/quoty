class CreateWikis < ActiveRecord::Migration
  def change
    create_table :wikis do |t|
      t.string :title
      t.text :description
      t.string :ancestry
      t.references :user

      t.timestamps
    end
    add_index :wikis, :ancestry
  end
end
