class AddReadColumntoGames < ActiveRecord::Migration[7.0]
  def change
    add_column :games, :read, :boolean, default: false
  end
end
