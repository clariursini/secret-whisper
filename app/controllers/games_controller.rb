class GamesController < ApplicationController
  def index
    @games = Game.all.where(crurrent_user)
  end

  def create
    @gane = Game.create!(game_params)
    redirect_to results_path(@game)
  end

  private

  def game_params
    params.permit(:player1, :player2)
  end
end
