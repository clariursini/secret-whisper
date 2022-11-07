class ConversationsController < ApplicationController
  def index
    @users = User.all
    @conversations = Conversation.all
    @conversation = Conversation.new
  end

  def show
    @conversation = Conversation.find(params[:id])
    @messages = @conversation.messages
    @message = Message.new

    if @messages.length > 10
      @over_ten = true
      @messages = @messages[-10..-1]
    end

    if params[:m]
      @over_ten = false
      @messages = @conversation.messages
    end

    if @messages.last
      if @messages.last.user_id != current_user.id
        @messages.last.read = true
      end
    end
  end

  def create
    if Conversation.between(params[:sender_id], params[:recipient_id]).present?
      @conversation = Conversation.between(params[:sender_id], params[:recipient_id]).first
    else
      @conversation = Conversation.create!(conversation_params)
    end
    redirect_to conversation_path(@conversation)
  end

  private

  def conversation_params
    params.permit(:sender_id, :recipient_id)
  end
end
