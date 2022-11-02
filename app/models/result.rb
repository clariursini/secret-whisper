class Result < ApplicationRecord
  belongs_to :game
  belongs_to :user
  validates_presence_of :score
end
