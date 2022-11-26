class AddReadColumntoBeers < ActiveRecord::Migration[7.0]
  def change
    rename_column :beers, :status, :read
  end
end
