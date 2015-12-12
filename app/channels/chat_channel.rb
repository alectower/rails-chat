class ChatChannel < ApplicationCable::Channel
  def subscribed
    @color = ["grey", "red", "blue", "green", "purple"].sample(1)
    stream_from "chat_#{params[:room]}"
  end

  def receive(data)
    ActionCable.server.broadcast "chat_#{params[:room]}",
      {
        body: ActionController::Base.helpers.sanitize(data["body"]),
        email: current_user.email,
        color: @color
      }
  end
end
