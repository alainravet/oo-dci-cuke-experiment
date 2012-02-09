
When /^I add a talk to it$/ do
  Handler::TalkCreation.new(current_user).create(@it)
end

When 'I make a proposal titled "$title"' do |title|
  Handler::Proposal::Creation.new(current_user).create(@meeting, title)
end