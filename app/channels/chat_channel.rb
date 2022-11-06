class ChatChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "some_channel"
    channel = Conversation.find(params[:conversation_id])
    stream_for channel
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
