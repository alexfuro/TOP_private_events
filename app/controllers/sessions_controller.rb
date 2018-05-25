class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(username: params[:sessions][:username])
    if @user
      log_in @user
      redirect_to @user
    else
      flash[:danger] = "Username not found!"
      render 'new'
    end
  end

  def destroy
    session[:id] = nil
    redirect_to root_url
  end
end
