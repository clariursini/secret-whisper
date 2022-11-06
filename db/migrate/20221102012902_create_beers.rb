class CreateBeers < ActiveRecord::Migration[7.0]
  def change
    create_table :beers do |t|
      t.integer :sender_id
      t.integer :recipient_id
      t.boolean :status, :default => false

      t.timestamps
    end
  end
end
