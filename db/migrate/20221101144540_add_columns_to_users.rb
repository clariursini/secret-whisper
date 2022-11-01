class AddColumnsToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :name, :string
    add_column :users, :description, :text
    add_column :users, :age, :integer
  end
end
