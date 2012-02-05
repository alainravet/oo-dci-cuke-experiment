Given /^a meeting exists with the title "([^"]*)"$/ do |title|
  @meeting_manager ||= MeetingManager.new
  @meeting_fixture = @meeting_manager.create_meeting(:title => title)
end

When /^I request the last meeting$/ do
  @meeting = @meeting_manager.get_meeting
end

Then /^I obtain the meeting$/ do
  @meeting.should == @meeting_fixture
end

When /^the meeting title is "([^"]*)"$/ do |expected_title|
  @meeting.title.should == expected_title
end

When /^the meeting has no attendees$/ do
  @meeting.should have(0).attendees
end

When /^the meeting has no talks$/ do
  @meeting.should have(0).talks
end