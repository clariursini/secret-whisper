class AddDrawColumnToGame < ActiveRecord::Migration[7.0]
  def change
    add_column :games, :draw, :string
  end
end
