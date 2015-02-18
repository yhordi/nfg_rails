class UsersController < ActionController::Base

  def show
    if session[:id] == nil
      redirect_to root_path
    else
      @user = User.find params[:id]
      render :json => @user
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :password)
  end
end
