module AuthHelper
  def valid_credentials?(user)
    user.authenticate(params[:old_password]) == user && params[:user][:password] == params[:password_again]
  end
end
