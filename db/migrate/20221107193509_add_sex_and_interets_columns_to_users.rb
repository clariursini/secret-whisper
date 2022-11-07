class AddSexAndInteretsColumnsToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :gender, :string
    add_column :users, :interests, :string
  end
end
