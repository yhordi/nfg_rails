module AuthHelper
  def valid_credentials?(user)
    user.authenticate(params[:old_password]) == user
  end

  def new_passwords_match?
    params[:user][:password] == params[:password_again]
  end

  def validate_user(user)
    if valid_credentials?(user)
      validate_new_passwords(user)
    else
      flash[:error] = unsaved_password(invalid_password)
    end
  end

  def validate_new_passwords(user)
    if new_passwords_match?
      user.password = params[:user][:password]
      user.update_attributes(user_params)
      flash[:notice] = "Password updated"
    else
      flash[:error] = unsaved_password(non_matching)
    end
  end
end
