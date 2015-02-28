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
    validate_user(@user)
    redirect_to user_path
  end

  private

  def user_params
    params.require(:user).permit(:username, :password)
  end
end
