require 'timecop'
require File.join(File.dirname(__FILE__), '..', '..', 'lib', 'meeting')
require File.join(File.dirname(__FILE__), '..', '..', 'lib', 'objects_manager')

Before do
  @today_date = Time.now.to_date
  Timecop.freeze @today_date.to_time
  @objects_manager = ObjectsManager.new
end

Transform /^-?(no|\d+)$/ do |number|
  number.to_i
end