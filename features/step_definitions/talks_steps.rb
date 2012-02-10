# Setup :
#------------


When 'I add a talk to it titled "$title"' do |title|
  author = current_user
  Handler::Talk::Creation.new(current_user_credentials).create(author, @it, title)
end

When 'I make a proposal titled "$title"' do |title|
  @proposal = Handler::Proposal::Creation.new(current_user_credentials).create(@meeting, title)
end

When /^(I|an admin) accepts? the proposal$/ do |who|
  acceptor = who=='I' ? current_user_credentials : $credentials_manager.get_test_admin_creds
  @talk = rescue_errors do
            Handler::Proposal::Acceptation.new(acceptor).accept(@proposal)
          end
end


# Tests :
#------------
