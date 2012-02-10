%w{
  objects_manager
  session_manager
  credentials_manager

}.each {|file| require_relative file}
