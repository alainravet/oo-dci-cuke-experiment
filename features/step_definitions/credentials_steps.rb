
# Setup :
#---------

Given /^I am not authenticated$/ do
  $session_manager.logout if current_user_credentials
end

When /^I log in with valid :(plain|admin) user credentials$/ do |level|
  name, pwd = case level.to_sym
                when :plain   then ['plain-joe', 'secret']
                when :admin   then ['admin-jim', 'secret']
              end
  $session_manager.login(name, pwd)
end

Given /^I am (authenticated as anon|authenticated|authenticated as plain|authenticated as admin)$/ do |action|
  if action.include?('admin')
    step %{I log in with valid :admin user credentials}
  elsif action == 'authenticated as anon'
    step %{I am not authenticated}
  else
    step %{I log in with valid :plain user credentials}
  end
end


# uses a Transform
When /^I log in with (valid credentials|invalid credentials)$/ do |credentials|
  $session_manager.login(*credentials)
end

When /^I log out$/ do
  $session_manager.logout
end


# Tests :
#---------

Then /^nobody is logged in$/ do
  current_user_credentials.should_not be
end

Then /^somebody is logged in$/ do
  current_user_credentials.should be
end

Then /^(?:my|the current) user rights are :(admin|plain)$/ do |expected_rights|
  case expected_rights
    when 'admin' then current_user_credentials.should     be_admin
    when 'plain' then current_user_credentials.should_not be_admin
    else
      fail "invalid rights #{expected_rights.to_sym.inspect}"
  end
end

When /^(\d+) users?\s+(?:has|have)\s+:(plain|admin) credentials$/ do |nof_users, expected_rights|
  users = $credentials_manager.credentials.select {|u| u.rights == expected_rights.to_sym}.collect(&:user)
  users.size.should == nof_users
end