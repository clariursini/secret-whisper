class FriendsController < ApplicationController
  def index
    @users = User.all # agregar un filtro para que solo sean los de ese bar
    @conversation = Conversation.new
    @beer = Beer.new
    @beers = Beer.all
  end

  def show
    if params[:sender_id].nil? && params[:recipient_id].nil?
      @user = User.find(params[:format])
    else
      @user = User.find(params[:sender_id], params[:recipient_id])
    end
    @conversation = Conversation.new
    @beer = Beer.new
    @beers = Beer.all
  end
end
