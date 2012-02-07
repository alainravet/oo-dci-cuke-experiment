Given /^a meeting exists with the title "([^"]*)"$/ do |title|
  @meeting_manager ||= MeetingManager.new
  @meeting_fixture = @meeting_manager.create_meeting(:title => title, :date => Date.today)
end

Given /^a past meeting exists with the title "([^"]*)"$/ do |title|
  @meeting_manager ||= MeetingManager.new
  @meeting_fixture = @meeting_manager.create_meeting(:title => title, :date => Date.today-1)
end

def the_meetings
  @meetings
end

def the_meeting
  @meeting || the_meetings.first
end

When /^I request the last meeting$/ do
  @meeting = @meeting_manager.get_meeting
end

When /^I request all the meetings$/ do
  @meetings = @meeting_manager.get_meetings
end

When /^I request all the past meetings$/ do
  @meetings = @meeting_manager.get_past_meetings
end

When /^I request all the current meetings$/ do
  @meetings = @meeting_manager.get_current_meetings
end

Then /^I obtain the meeting$/ do
  the_meeting.should == @meeting_fixture
end

Then /^I obtain (\d+) meeting[s]?$/ do |size|
  the_meetings.length.should == size.to_i
end


When /^the meeting title is "([^"]*)"$/ do |expected_title|
  the_meeting.title.should == expected_title
end

When /^the meeting has no attendees$/ do
  the_meeting.should have(0).attendees
end

When /^the meeting has no talks$/ do
  the_meeting.should have(0).talks
end

When /^the first meeting title is\s+"([^"]*)"$/ do |expected_title|
  the_meetings.first.title.should == expected_title
end

When /^the last meeting title is\s+"([^"]*)"$/ do |expected_title|
  the_meetings.last.title.should == expected_title
end

When /^the meeting date is today$/ do
  the_meeting.date.should == Date.today
end
When /^the meeting date is yesterday$/ do
  the_meeting.date.should == Date.today-1
end
