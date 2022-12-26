class ConversationsController < ApplicationController
  def index
    @users = User.all
    @conversations = Conversation.all

    @conv = @conversations.select { |conv| conv.messages.last != nil}
    @conv_ordered = @conv.sort_by { |conv| conv.messages.last.created_at }
    @conv_ordered = @conv_ordered.reverse

    @conversation = Conversation.new

    # @conversations.each do |conversation|
    #   @message_date = conversation.messages.last.created_at
    #   @conv_ordered = @conversations.sort_by { |conv| conv.messages.last.created_at }
    # end
  end

  def show
    @conversation = Conversation.find(params[:id])
    @messages = @conversation.messages
    @message = Message.new

    # if @messages.length > 10
    #   @over_ten = true
    #   @messages = @messages[-10..-1]
    # end

    # if params[:m]
    #   @over_ten = false
    #   @messages = @conversation.messages
    # end

    # if @messages.last
    #   if @messages.last.user_id != current_user.id
    #     @messages.last.read = true
    #   end
    # end

    @messages.each do |message|
      if message.user_id != current_user.id
        message.read = true
        message.save!
      end
    end

  end

  def create
    if Conversation.between(params[:sender_id], params[:recipient_id]).present?
      @conversation = Conversation.between(params[:sender_id], params[:recipient_id]).first
    else
      @conversation = Conversation.create!(conversation_params)
      # @conversation.messages.last = Message.create!(body: ".", user_id: current_user.id, conversation_id: @conversation.id)
      # @conversation.save!
    end
    redirect_to conversation_path(@conversation)
  end

  private

  def conversation_params
    params.permit(:sender_id, :recipient_id)
  end
end
