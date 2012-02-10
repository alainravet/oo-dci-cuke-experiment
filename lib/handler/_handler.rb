module Handler
end

%w( base
    authenticator
    registration
    meeting/creation
    meeting/retrieval
    proposal/creation
    proposal/acceptation
    talk/creation
).each do |h|
  require_relative(h)
end