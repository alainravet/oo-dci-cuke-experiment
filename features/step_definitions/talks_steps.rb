# Setup :
#------------


When 'I add a talk to it titled "$title"' do |title|
  Handler::TalkCreation.new(current_user).create(current_user, @it, title)
end

When 'I make a proposal titled "$title"' do |title|
  Handler::Proposal::Creation.new(current_user).create(@meeting, title)
end

When /^an admin accepts the proposal$/ do
  $session_manager.as_admin do
    Handler::Proposal::Acceptation.new(current_user).accept(@proposal)
  end

end


# Tests :
#------------
