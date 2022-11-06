class FriendsController < ApplicationController
  def index
    @users = User.all
    @conversations = Conversation.all
    @conversation = Conversation.new
  end
end
