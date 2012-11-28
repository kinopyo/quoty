class CreateProviders < ActiveRecord::Migration
  def change
    create_table :providers do |t|
      t.string :provider
      t.string :uid
      t.string :image
      t.references :user

      t.timestamps
    end
    add_index :providers, :user_id
  end
end
