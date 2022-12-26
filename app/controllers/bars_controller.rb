class BarsController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :barcode ]
  def index
    @bars = Bar.all
    @barsito = Bar.new
  end

  def new
    @barsito = Bar.new
  end

  def create
    @barsito = Bar.new(bar_params)
    if @barsito.save
      redirect_to bars_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @bar = Bar.find(params[:id])
    @bar.destroy
  end

  def show
    @bar = Bar.find(current_user.bar_code)
    @users = User.where(bar_code: current_user.bar_code)
    @conversation = Conversation.new
    @beer = Beer.new
    @beers = Beer.all
    @game = Game.new

    # ------BEERS NOTIFICATIONS------#
    @beersita = Beer.where(recipient_id: current_user)
    @beer_read = []
    @beersita.each do |beer|
      if beer.read == false
        @beer_read << beer
      end
    end

    # ------CONVERSATIONS NOTIFICATIONS------#
    @conv = Conversation.where(recipient_id: current_user) + Conversation.where(sender_id: current_user)
    @conv_read = []
    @conv.each do |conversation|
      @messages = conversation.messages
      @messages.each do |message|
        if message.read == false && message.user_id != current_user.id
          @conv_read << message
        end
      end
    end

    # ------GAMES NOTIFICATIONS------#
    @games = Game.where(player2_id: current_user)
    @games_read = []
    @games.each do |game|
      if game.read == false && game.winner_id.nil?
        @games_read << game
      end
    end

    @games2 = Game.where(player1_id: current_user)
    @games2.each do |game|
      if !game.winner_id.nil? && game.read == false
        @games_read << game
      end
    end

  end

  def barcode
    if current_user
      @user = User.find(current_user.id)
      @user.bar_code = params[:id]
      @user.save
      redirect_to bar_path(current_user.bar_code)
    else
      barcode = params[:id]
      redirect_to root_path(:barcode => barcode)
    end
  end

  private

  def bar_params
    params.require(:bar).permit(:name)
  end
end
