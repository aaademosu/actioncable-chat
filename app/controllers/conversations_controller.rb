class ConversationsController < ApplicationController

  def new
  end

  def create
    recipients = User.where(id: conversation_params[:recipients])
    conversation = current_user.send_message(recipients, conversation_params[:body], conversation_params[:subject]).conversation

    ActionCable.server.broadcast(
      "conversation_#{conversation.id}",
      subject: conversation_params[:subject],
      message: conversation_params[:body],
      recipients: recipients,
      user: current_user.name
    )

    flash[:success] = "Your message was successfully sent!"
    redirect_to conversation_path(conversation)
  end

  def show
    @receipts = conversation.receipts_for(current_user)
    # mark conversation as read
    conversation.mark_as_read(current_user)
  end

  def reply
    current_user.reply_to_conversation(conversation, message_params[:body])

    ActionCable.server.broadcast(
      "conversation_#{conversation.id}",
      message: message_params[:body],
      recipients: conversation,
      user: current_user.name
    )

    flash[:notice] = "Your reply message was successfully sent!"
    redirect_to conversation_path(conversation)
  end

  private

  def message_params
    params.require(:message).permit(:body, :subject)
  end

  def conversation_params
    params.require(:conversation).permit(:subject, :body,recipients:[])
  end
end
