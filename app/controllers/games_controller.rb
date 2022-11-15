class GamesController < ApplicationController
  def index
    @games = Game.where("player1_id = ? OR player2_id = ?", current_user, current_user).order(created_at: :desc)
    @game = Game.new
  end

  def show
    @game = Game.find(params[:id])
  end

  def new
    @game = Game.new
  end

  def create
    @player1 = User.find(params[:player1_id]).id
    @player2 = User.find(params[:player2_id]).id
    @game = Game.new(game_params)

    @game.player1_id = @player1
    @game.player2_id = @player2

    if @game.save!
      redirect_to bar_path(current_user.bar_code)
    else
      render :new, status: :unprocessable_entity
    end

    # if Game.between(params[:player1_id], params[:player2_id]).present?
    #   @game = Game.between(params[:player1_id], params[:player2_id]).first
    # else
    #   @game = Game.create!(game_params)
    # end
  end

  def edit
    @game = Game.find(params[:id])
  end

  def update
    @game = Game.find(params[:id])
    @game.update(game_params)

    if @game.hand1 == "Paper" && @game.hand2 == "Rock"
      @game.winner_id = @game.player1_id
      @game.save!
    elsif @game.hand1 == "Paper" && @game.hand2 == "Scissors"
      @game.winner_id = @game.player2_id
      @game.save!
    elsif @game.hand1 == "Paper" && @game.hand2 == "Paper"
      @game.winner_id = @game.player1_id
      @game.draw = "Draw"
      @game.save!

    elsif @game.hand1 == "Rock" && @game.hand2 == "Paper"
      @game.winner_id = @game.player2_id
      @game.save!
    elsif @game.hand1 == "Rock" && @game.hand2 == "Scissors"
      @game.winner_id = @game.player1_id
      @game.save!
    elsif @game.hand1 == "Rock" && @game.hand2 == "Rock"
      @game.winner_id = @game.player1_id
      @game.draw = "Draw"
      @game.save!

    elsif @game.hand1 == "Scissors" && @game.hand2 == "Paper"
      @game.winner_id = @game.player1_id
      @game.save!
    elsif @game.hand1 == "Scissors" && @game.hand2 == "Rock"
      @game.winner_id = @game.player2_id
      @game.save!
    elsif @game.hand1 == "Scissors" && @game.hand2 == "Scissors"
      @game.winner_id = @game.player1_id
      @game.draw = "Draw"
      @game.save!
    end

    redirect_to game_path(@game)

  end

  private

  def game_params
    params.require(:game).permit(:hand1, :hand2)
  end
end
