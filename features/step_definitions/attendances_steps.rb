# Setup :
#------------


When /^I register for the meeting$/ do
  Handler::Registration.new(current_user_credentials).register_for(cache_get(:meeting))
end


# Tests :
#------------

# uses a Transform
Then /^I am (not registered|registered) to (the meeting titled "[^"]*")$/ do |action, meeting|
  attendance_detected = current_user.attendances.include?(meeting)
  if action == "registered"
    fail "current user is NOT registered to the meeting titled '#{title}'" unless attendance_detected
  else
    fail "current user IS registered to the meeting titled '#{title}'"     if attendance_detected
  end

end