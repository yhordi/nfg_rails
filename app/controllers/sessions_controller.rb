class SessionsController < ApplicationController
  include AuthenticationConcern
  def create
    @user = User.find_by(username: params[:username])
    if @user && @user.authenticate(params[:password])
      login @user
      redirect_to root_path
    else
      render :json => {:errors => "Invalid email and password combination"}, :status => :unprocessable_entity
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