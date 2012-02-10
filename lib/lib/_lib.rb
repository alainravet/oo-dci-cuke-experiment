%w{
  model/base
  errors/authorization_error

}.each {|file| require_relative file}
