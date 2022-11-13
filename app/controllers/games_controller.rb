class GamesController < ApplicationController
  def index
    @games = Game.where("player1_id = ? OR player2_id = ?", current_user, current_user).order(created_at: :desc)
    @game = Game.new
  end

  def show
    @game = Game.find(params[:id])
  end

  def new
    @game = Game.new(game_params)
  end

  def create
    if Game.between(params[:player1_id], params[:player2_id]).present?
      @game = Game.between(params[:player1_id], params[:player2_id]).first
    else
      @game = Game.create!(game_params)
    end
  end

  def edit
    @game = Game.find(params[:id])
  end

  def update
    @game = Game.find(params[:id])
    @game.update(game_params)

    redirect_to game_path(@game)
  end

  private

  def game_params
    params.permit(:player1_id, :player2_id, :winner_id)
  end
end
