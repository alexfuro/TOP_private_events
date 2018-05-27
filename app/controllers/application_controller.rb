class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def log_in(user)
    session[:id] = user.id
    current_user
  end

  def current_user
    @current_user ||= User.find(session[:id])
  end

  def current_user=(user)
    @current_user = user
  end
end
