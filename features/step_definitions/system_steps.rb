
# Setup
#----------


# Tests
#----------

Given /^the system services are (running|not running)$/ do |outcome|
  if outcome=='running'
    $session_manager     .should be_a(SessionManager)
    $objects_manager     .should be_a(ObjectsManager)
    $credentials_manager .should be_a(CredentialsManager)
  else
    $session_manager     .should_not be
    $objects_manager     .should_not be
    $credentials_manager .should_not be
  end
end
