class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Your account has been created!"
      log_in(@user)
      redirect_to root_path
    else
      flash.now[:danger] = "Your account was not saved!"
      render new_user_path
    end
  end

  def show
    @user = User.find(params[:id])
    @upcoming_events = current_user.upcoming_events
    @prev_events = current_user.previous_events
  end

  private
    def user_params
      params.require(:user).permit(:username)
    end
end
