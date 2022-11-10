class Beer < ApplicationRecord
  belongs_to :sender, :foreign_key => :sender_id, class_name: 'User'
  belongs_to :recipient, :foreign_key => :recipient_id, class_name: 'User'

  validates_uniqueness_of :sender_id, :scope => :recipient_id

  scope :between, -> (sender_id, recipient_id) do
    where("(beers.sender_id = ? AND beers.recipient_id =?) OR (beers.sender_id = ? AND beers.recipient_id =?)", sender_id, recipient_id, recipient_id, sender_id)
  end
end
