Given /^a meeting exists with the title "([^"]*)"$/ do |title|
  @meeting_manager ||= MeetingManager.new
  @meeting_fixture = @meeting_manager.create_meeting(:title => title, :date => today)
end

Given /^a past meeting exists with the title "([^"]*)"$/ do |title|
  @meeting_manager ||= MeetingManager.new
  @meeting_fixture = @meeting_manager.create_meeting(:title => title, :date => yesterday)
end



When /^I request the last meeting$/ do
  @meeting = @meeting_manager.get_meeting
end

When /^I request all the meetings$/ do
  @meetings = @meeting_manager.get_meetings
end

When /^I request all the ([^"]*) meetings$/ do |selector|
  @meetings = case selector
    when 'past'     then @meeting_manager.get_past_meetings
    when 'current'  then @meeting_manager.get_current_meetings
  end
end


def the_meetings
  @meetings || @meeting_manager.get_meetings
end

def the_meeting
  @meeting || the_meetings.first
end
