# Setup :
#------------


When /^I register for the meeting$/ do
  Handler::Registration.new(current_user).register_for(@it)
end


# Tests :
#------------

Then /^I am (not registered|registered) to the meeting titled "([^"]*)"$/ do |action, title|
  attendance_detected = current_user.attendances.any?{|m| m.title==title }
  if action == "registered"
    fail "current user is NOT registered to the meeting titled '#{title}'" unless attendance_detected
  else
    fail "current user IS registered to the meeting titled '#{title}'"     if attendance_detected
  end

end