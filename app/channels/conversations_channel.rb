class ConversationsChannel < ApplicationCable::Channel  

  def subscribed
    # stream_from 'conversations'

    # stop_all_streams
    stream_from "conversation_#{params[:conversation_id]}"
  end
end
