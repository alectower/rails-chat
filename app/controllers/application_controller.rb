class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private

  def sign_in(user)
    session[:user_id] = user.id
    cookies.signed[:user_id] = user.id
  end

  def sign_out
    session.delete :user_id
    cookies.delete :user_id
  end

  def current_user
    User.find(session[:user_id]) if session[:user_id]
  end
end
