class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.string :file
      t.references :quote

      t.timestamps
    end
  end
end
