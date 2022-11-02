class Game < ApplicationRecord
  belongs_to :player1, :foreign_key => :player1, class_name: 'User'
  belongs_to :player2, :foreign_key => :player2, class_name: 'User'

  has_one :result, dependent: :destroy
end
