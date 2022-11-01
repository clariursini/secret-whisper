class FriendsController < ApplicationController
  def index
    @users = User.all
    @conversations = Conversation.all
  end
end
