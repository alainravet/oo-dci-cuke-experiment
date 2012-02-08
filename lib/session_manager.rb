class SessionManager

  attr_reader :current_user

  def login(user_name, user_password)
    @current_user = Handler::Authenticator.new(@current_user).authenticate(user_name, user_password)
  end

  def logout
    @current_user  = nil
  end

  def current_user_admin?
    current_user && current_user.admin?
  end

  def as_admin
    prev_user = @current_user
    @current_user = TEST_ADMIN
    yield
    @current_user = prev_user
  end
end