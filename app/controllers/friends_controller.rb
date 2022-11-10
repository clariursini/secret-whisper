class FriendsController < ApplicationController
  def index
    @users = User.all # agregar un filtro para que solo sean los de ese bar
    @conversation = Conversation.new
    @beer = Beer.new
    @beers = Beer.all
  end

  def show
    @user = User.find(params[:sender_id], params[:recipient_id])
    @conversation = Conversation.new
    @beer = Beer.new
  end
end
