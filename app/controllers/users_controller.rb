include AuthHelper
include ErrorsHelper
class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    if session[:id] == nil || @user[:id] != session[:id]
      redirect_to root_path
    end
  end

  def update
    @user = User.find(params[:id])
    if valid_credentials?(@user)
      @user.password = params[:user][:password]
      @user.save!
      flash[:notice] = "Password updated"
      redirect_to user_path
    else
     redirect_to user_path, :flash => { :error =>  unsaved_password}
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :password)
  end
end
