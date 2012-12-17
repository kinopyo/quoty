class AddOmniauthInfoUpdatedAtToUsers < ActiveRecord::Migration
  def change
    add_column :users, :omniauth_info_updated_at, :datetime
  end
end
