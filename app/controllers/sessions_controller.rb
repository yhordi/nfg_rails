class SessionsController < ApplicationController
  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      login user
      render json: { redirect: redirect_path }
    else
      render :json => {:errors => "Invalid email and password combination"}, :status => :unprocessable_entity
    end
  end

  def destroy
    session.clear
    redirect_to root_path
  end

end