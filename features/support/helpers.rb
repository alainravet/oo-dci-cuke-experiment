TEST_ADMIN = User.new("name","pwd", :admin)


def current_user
  $session_manager.current_user
end