class AddBarIdToUsers < ActiveRecord::Migration[7.0]
  def change
    add_reference :users, :bar, null: false, foreign_key: true, :default => 1
  end
end
