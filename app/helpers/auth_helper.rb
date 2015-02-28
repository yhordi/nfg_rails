module AuthHelper
  def valid_credentials?(user)
    user.authenticate(params[:old_password]) == user
  end

  def new_passwords_match?(user)
    params[:user][:password] == params[:password_again]
  end

  def validate_user(user)
    if valid_credentials?(user)
      validate_new_passwords
    else
      flash[:error] =  unsaved_password(invalid_password)
    end
  end

  def validate_new_passwords(user)
    if new_passwords_match?(user)
      # activerecord savey stuffs
    end
  end
end
