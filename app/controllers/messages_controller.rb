class MessagesController < ApplicationController
  before_action do
    @conversation = Conversation.find(params[:conversation_id])
  end

  def index
    @messages = @conversation.messages
    @message = @conversation.messages.new
  end

  def create
    @message = @conversation.messages.new(message_params)
    @conversation = Conversation.find(params[:conversation_id])
    @message.conversation = @conversation
    @message.user = current_user

    if @message.save
      ChatChannel.broadcast_to(
        @conversation,
        # render_to_string(partial: "messages/message", locals: { message: @message })
        message: render_to_string(partial: "message", locals: { message: @message }),
        sender_id: @message.user.id
      )
      head :ok
    else
      redirect_to conversation_messages_path(@conversation)
    end
  end

  private

  def message_params
    params.require(:message).permit(:body, :user_id, :conversation_id)
  end
end
