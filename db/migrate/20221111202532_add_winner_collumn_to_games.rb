class AddWinnerCollumnToGames < ActiveRecord::Migration[7.0]
  def change
    add_column :games, :winner, :integer
  end
end
