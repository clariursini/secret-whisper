class AddHandColumnstoGame < ActiveRecord::Migration[7.0]
  def change
    add_column :games, :hand1, :string
    add_column :games, :hand2, :string
  end
end
