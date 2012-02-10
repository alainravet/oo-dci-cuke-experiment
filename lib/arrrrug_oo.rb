%w{
  support/_support
  lib/_lib
  models/_models
  handler/_handler
  services/_services

}.each {|file| require_relative file}
