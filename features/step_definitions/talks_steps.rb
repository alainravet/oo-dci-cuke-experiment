# Setup :
#------------


When 'I add a talk to it titled "$title"' do |title|
  Handler::TalkCreation.new(current_user).create(current_user, @it, title)
end

When 'I make a proposal titled "$title"' do |title|
  @proposal = Handler::Proposal::Creation.new(current_user).create(@meeting, title)
end

When /^(I|an admin) accepts? the proposal$/ do |who|
  acceptor = who=='I' ? current_user : TEST_ADMIN
  @talk = rescue_errors do
            Handler::Proposal::Acceptation.new(acceptor).accept(@proposal)
          end
end


# Tests :
#------------
