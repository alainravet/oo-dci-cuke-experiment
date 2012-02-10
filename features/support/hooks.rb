Before do
  @today_date = Time.now.to_date
  Timecop.freeze @today_date.to_time
  launch_system_services
  @errors_raised = []
end

def launch_system_services
  App.start_services

  App.credentials_manager.add_credential_for('plain-joe', 'secret', :plain)
  App.credentials_manager.add_credential_for('admin-jim', 'secret', :admin)
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
