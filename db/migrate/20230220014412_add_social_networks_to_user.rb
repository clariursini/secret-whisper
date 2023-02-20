class AddSocialNetworksToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :instagram, :string
    add_column :users, :twitter, :string
    add_column :users, :tiktok, :string
    add_column :users, :snapchat, :string
    add_column :users, :linkedin, :string
    add_column :users, :other_social, :string
  end
end
