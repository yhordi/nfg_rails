module AuthenticationConcern

  def current_user
    @current_user ||= User.find(session[:id]) if session[:id]
  end

  def logout
    session.clear
  end

  def login(user)
    session[:id] = user.id
    session[:username] = user.username
  end

  # def redirect_path
  #   user? ? dashboard_index_path : member_dashboard_index_path
  # end

  def authenticate_user!
    redirect_to root_path unless current_user.present?
  end
end