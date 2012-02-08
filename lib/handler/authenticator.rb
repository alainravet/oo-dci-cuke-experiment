class Handler::Authenticator < Handler::Base

  def authenticate(user_name, user_password)
    $credentials_manager.authenticate(user_name, user_password)
  end

end