class SessionManager

  attr_reader :current_user

  def login(user_name, user_password)
    if user = $credentials_manager.authenticate(user_name, user_password)
      @current_user = user
    else
    end
  end

  def logout
    @current_user  = nil
  end

end