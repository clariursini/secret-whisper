class FriendsController < ApplicationController
  def index
    @users = User.all
    @conversations = Conversation.all
    @conversation = Conversation.new
  end

  def show
    @user = User.find(params[:sender_id], params[:recipient_id])
    @conversation = Conversation.new
  end
end
