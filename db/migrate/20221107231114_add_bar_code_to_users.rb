class AddBarCodeToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :bar_code, :integer, :default => 1
  end
end
