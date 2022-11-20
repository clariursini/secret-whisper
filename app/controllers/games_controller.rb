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

    winner
    @game.save!

    redirect_to game_path(@game)

  end

  def compareHand(handA, handB)

    if handA == "Paper" && handB == "Rock"
      1
    elsif handA == "Paper" && handB == "Scissors"
      2
    elsif handA == "Paper" && handB == "Paper"
      3

    elsif handA == "Rock" && handB == "Paper"
      2
    elsif handA == "Rock" && handB == "Scissors"
      1
    elsif handA == "Rock" && handB == "Rock"
      3

    elsif handA == "Scissors" && handB == "Paper"
      1
    elsif handA == "Scissors" && handB == "Rock"
      2
    elsif handA == "Scissors" && handB == "Scissors"
      3
    end

  end

  def winner
    raise
    hand1 = @game.hand1
    hand2 = params[:hand2]
    hand3 = @game.hand3
    hand4 = params[:hand4]
    hand5 = @game.hand5
    hand6 = params[:hand6]

    a = [
      compareHand(hand1, hand2),
      compareHand(hand3, hand4),
      compareHand(hand5, hand6)
    ]

    if a.count(1) > a.count(2) && a.count(1) > a.count(3) # gana el 1
      @game.winner_id = @game.player1_id
    elsif a.count(2) > a.count(1) && a.count(2) > a.count(3) # gana el 2
      @game.winner_id = @game.player2_id
    elsif a.count(1) == a.count(2) && a.count(3) == 1 #empate
      @game.winner_id = @game.player1_id
      @game.draw = "Draw"
    elsif a.count(3) == 3 #empate
      @game.winner_id = @game.player1_id
      @game.draw = "Draw"
    end
  end


  private

  def game_params
    params.require(:game).permit(:hand1, :hand2, :hand3, :hand4, :hand5, :hand6)
  end
end
