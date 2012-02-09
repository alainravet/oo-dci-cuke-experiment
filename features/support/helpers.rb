def current_user_credentials
  $session_manager.current_user_credentials
end

def current_user
  current_user_credentials && current_user_credentials.user
end

def rescue_errors
  yield
rescue Exception, Error => e
  @errors_raised << e
  nil
end
