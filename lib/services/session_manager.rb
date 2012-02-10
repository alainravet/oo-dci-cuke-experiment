class SessionManager

  attr_reader :current_user_credentials

  def login(user_name, user_password)
    @current_user_credentials = Handler::Authenticator.new(@current_user).authenticate(user_name, user_password)
  end

  def logout
    @current_user_credentials = nil
  end

  def current_user_admin?
    @current_user_credentials && @current_user_credentials.admin?
  end

  def as_admin
    prev_cred = @current_user_credentials
    @current_user_credentials = App.credentials_manager.get_test_admin_creds
    yield
    @current_user_credentials = prev_cred
  end

  def current_user
    creds_to_user(@current_user_credentials)
  end

  def creds_to_user(creds)
    creds && creds.user
  end
end
