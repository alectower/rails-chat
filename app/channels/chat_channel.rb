class ChatChannel < ApplicationCable::Channel
  def subscribed
    p 'subscribed'
    @color = ["red", "blue", "green", "yellow", "purple"].sample(1)
    stream_from "chat_#{params[:room]}"
  end

  def receive(data)
    p 'received'
    ActionCable.server.broadcast "chat_#{params[:room]}", data.merge!(color: @color)
  end
end
