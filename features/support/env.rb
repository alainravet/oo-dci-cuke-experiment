require 'timecop'
require File.join(File.dirname(__FILE__), '..', '..', 'lib', 'arrrrug_oo')

Before do
  @today_date = Time.now.to_date
  Timecop.freeze @today_date.to_time
  launch_system_services
end

TEST_ADMIN = User.new("name","pwd", :admin)


def launch_system_services
  $session_manager    = SessionManager.new
  $objects_manager    = ObjectsManager.new
  $credentials_manager = CredentialsManager.new

  $credentials_manager.users << User.new('plain-joe', 'secret', :plain)
  $credentials_manager.users << User.new('admin-jim', 'secret', :admin)
end

Transform /^-?(no|\d+)$/ do |number|
  number.to_i
end

def current_user
  $session_manager.current_user
end