
When /^I add a talk to it$/ do
  Handler::TalkCreation.new(current_user).create(@it)
end