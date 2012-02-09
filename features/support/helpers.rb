TEST_ADMIN = User.new("name","pwd", :admin)


def current_user
  $session_manager.current_user
end

def rescue_errors
  yield
rescue Exception, Error => e
  @errors_raised << e
  nil
end
