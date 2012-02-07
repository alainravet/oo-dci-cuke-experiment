
# Setup :
#---------

When /^I log in with valid :(plain|admin) user credentials$/ do |level|
  name, pwd = case level.to_sym
                when :plain   then ['plain-joe', 'secret']
                when :admin   then ['admin-jim', 'secret']
              end
  $session_manager.login(name, pwd)
end

When /^I try to log in with invalid credentials$/ do
  $session_manager.login('plain-joe', 'invalid password')
end

When /^I log out$/ do
  $session_manager.logout
end


# Tests :
#---------

Then /^nobody is logged in$/ do
  $session_manager.current_user.should_not be
end

Then /^somebody is logged in$/ do
  $session_manager.current_user.should be
end

Then /^(?:my|the current) user rights are :(admin|plain)$/ do |expected_rights|
  $session_manager.current_user.rights.should == expected_rights.to_sym
end

When /^(\d+) users?\s+(?:has|have)\s+:(plain|admin) credentials$/ do |nof_users, expected_rights|
  users = $credentials_manager.users.select {|u| u.rights == expected_rights.to_sym}
  users.size.should == nof_users
end