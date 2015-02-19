class UsersController < ApplicationController

  def show
    if session[:id] == nil
      redirect_to root_path
    else
      @user = User.find(params[:id])
    end
  end

  def update
    @user = User.find(params[:id])
    p "*"*50
    p params
    if @user.authenticate(params[:old_password]) == @user
      @user.password = params[:user][:password]
      @user.save!
      redirect_to user_path
    else
     redirect_to user_path, :flash => { :error => "Your new password was not saved." }
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :password)
  end
end
