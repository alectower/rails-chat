class ChatRoomController < ApplicationController
  before_filter :authorize

  def index
  end

  private

  def authorize
    redirect_to new_session_path unless current_user
  end
end
