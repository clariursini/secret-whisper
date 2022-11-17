class CreateResults < ActiveRecord::Migration[7.0]
  def change
    create_table :results do |t|
      t.references :game, index: true
      t.references :user, index: true
      t.integer :score
      t.timestamps
    end
  end
end
