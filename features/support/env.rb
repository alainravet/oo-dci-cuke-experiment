require 'timecop'
require File.join(File.dirname(__FILE__), '..', '..', 'lib', 'meeting')
require File.join(File.dirname(__FILE__), '..', '..', 'lib', 'objects_manager')

Before do
  @objects_manager = ObjectsManager.new
end