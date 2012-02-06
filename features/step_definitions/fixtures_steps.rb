Given /^meetings with those properties:$/ do |table|
  @objects_manager ||= ObjectsManager.new
  table.hashes.each do |row|
    title = row[:title]
    date  = when_to_date(row[:when])
    @meeting_fixture = @objects_manager.create_meeting(:title => title, :date => date)
  end
end

When /^I request the last meeting$/ do
  @meeting = @objects_manager.get_meeting
end

When /^I request (all the|all the current|all the past) meetings$/ do |current_or_past|
  @meetings = case current_or_past
    when 'all the'          then @objects_manager.get_meetings
    when 'all the past'     then @objects_manager.get_past_meetings
    when 'all the current'  then @objects_manager.get_current_meetings
  end
end


def the_meetings
  @meetings || @objects_manager.get_meetings
end

def the_meeting
  @meeting || the_meetings.first
end
