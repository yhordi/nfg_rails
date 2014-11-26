class SessionsController < ApplicationController
  include AuthenticationConcern
  protect_from_forgery with: :exception

  def create
    user = User.find_by(username: params[:username])
    if user && user.authenticate(params[:password])
      login(user)
      redirect_to root_path
    end
  end

  def new
  end

  def show
  end

  def destroy
    session.clear
    redirect_to root_path
  end

end