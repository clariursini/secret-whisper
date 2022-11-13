class ChangeNametoPlayersColumnsinGames < ActiveRecord::Migration[7.0]
  def change
    rename_column :games, :player1, :player1_id
    rename_column :games, :player2, :player2_id
    rename_column :games, :winner, :winner_id
  end
end
