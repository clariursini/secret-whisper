class FriendsController < ApplicationController
  def index
    @users = User.all
    @conversations = Conversation.all
    @conversation = Conversation.new
    # agregar un filtro para que solo sean los de ese bar
  end

  def show
    @user = User.find(params[:sender_id], params[:recipient_id])
    @conversation = Conversation.new
  end
end
