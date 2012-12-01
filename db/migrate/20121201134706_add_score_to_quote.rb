class AddScoreToQuote < ActiveRecord::Migration
  def change
    add_column :quotes, :score, :integer, default: 0
  end
end
