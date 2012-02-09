Before do
  @today_date = Time.now.to_date
  Timecop.freeze @today_date.to_time
  launch_system_services
end

def launch_system_services
  $session_manager    = SessionManager.new
  $objects_manager    = ObjectsManager.new
  $credentials_manager = CredentialsManager.new

  $credentials_manager.users << User.new('plain-joe', 'secret', :plain)
  $credentials_manager.users << User.new('admin-jim', 'secret', :admin)
end


#After do |scenario|
# if(scenario.failed?)
#    subject = "[Project X] #{scenario.exception.message}"
#    send_failure_email(subject)
#  end
#end
#
#AfterStep do |scenario|
#  # Do something after each step.
#end
#
#Before('@cucumis', '@sativus') do
#  # Do something before scenarios tagged @cucmis or @sativus
#end
