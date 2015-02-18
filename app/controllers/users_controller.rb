class UsersController < ApplicationController

  def show
    if session[:id] == nil
      redirect_to root_path
    else
      @user = User.find params[:id]
    end
  end

  def update
    user = User.find(params[:id])
    user.update_attributes
    redirect_to users_show_path
  end

  private

  def user_params
    params.require(:user).permit(:username, :password)
  end
end
