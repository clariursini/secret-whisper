class AddHandsToGame < ActiveRecord::Migration[7.0]
  def change
    add_column :games, :hand3, :string
    add_column :games, :hand4, :string
    add_column :games, :hand5, :string
    add_column :games, :hand6, :string
  end
end
