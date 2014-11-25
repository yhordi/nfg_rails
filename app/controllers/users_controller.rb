class UsersController < ApplicationController
  include AuthenticationConcern

  def show
    @user = User.find params[:id]
    render :json => @user
  end

  private

  def user_params
    params.require(:user).permit(:username, :password)
  end
end