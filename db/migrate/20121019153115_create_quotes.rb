class CreateQuotes < ActiveRecord::Migration
  def change
    create_table :quotes do |t|
      t.text :content
      t.string :name
      t.string :source
      t.string :language

      t.timestamps
    end
  end
end
