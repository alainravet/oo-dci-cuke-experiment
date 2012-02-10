# Setup :
#------------


When 'I add a talk to it titled "$title"' do |title|
  author = current_user
  Handler::Talk::Creation.new(current_user_credentials).create(author, cache_get(:meeting), title)
end

When 'I make a proposal titled "$title"' do |title|
  cache_push  :proposal,
              Handler::Proposal::Creation.new(current_user_credentials).create(cache_get(:meeting), title)
end

When /^(I|an admin) accepts? the proposal$/ do |who|
  acceptor = who=='I' ? current_user_credentials : App.credentials_manager.get_test_admin_creds
  value = rescue_errors do
            Handler::Proposal::Acceptation.new(acceptor).accept cache_get(:proposal)
  end
  cache_push  :talk, value
end


# Tests :
#------------
