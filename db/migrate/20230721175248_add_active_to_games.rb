class AddActiveToGames < ActiveRecord::Migration[7.0]
  def change
    add_column :games, :active, :boolean
  end
end
