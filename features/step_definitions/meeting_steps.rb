# Setup
############

When /^I try to create a meeting with (.*), (.*), and (.*)$/ do |title, location, when_|
  @it = @new_meeting = @objects_manager.create_meeting(
      :title    => title,
      :location => location,
      :date     => when_to_date(when_)
  )
end

