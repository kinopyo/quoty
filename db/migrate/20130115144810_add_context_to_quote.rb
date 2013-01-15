class AddContextToQuote < ActiveRecord::Migration
  def change
    add_column :quotes, :context, :text
  end
end
