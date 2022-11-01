class RenameColumnUserInConversations < ActiveRecord::Migration[7.0]
  def change
    rename_column :conversations, :userA, :sender_id
    rename_column :conversations, :userB, :recipient_id
  end
end
