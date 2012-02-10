
# Setup
#----------


# Tests
#----------

Given /^the system services are (running|not running)$/ do |outcome|
  if outcome=='running'
    App.session_manager     .should be_a(SessionManager)
    App.objects_manager     .should be_a(ObjectsManager)
    App.credentials_manager .should be_a(CredentialsManager)
  else
    App.session_manager     .should_not be
    App.objects_manager     .should_not be
    App.credentials_manager .should_not be
  end
end
