class Game < ApplicationRecord
  belongs_to :player1, :foreign_key => :player1_id, class_name: 'User'
  belongs_to :player2, :foreign_key => :player2_id, class_name: 'User'

  has_one :winner, :foreign_key => :winner_id, class_name: 'User'

  # validates_uniqueness_of :player1_id, :scope => :player2_id

  scope :between, -> (player1_id, player2_id) do
    where("(games.player1_id = ? AND games.player2_id =?) OR (games.player1_id = ? AND games.player2_id =?)", player1_id, player2_id, player2_id, player1_id)
  end
end
