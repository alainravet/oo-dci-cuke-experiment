Given /^a meeting exists with the title "([^"]*)"$/ do |title|
  @meeting_manager ||= MeetingManager.new
  @meeting_fixture = @meeting_manager.create_meeting(:title => title, :date => Date.today)
end

Given /^a past meeting exists with the title "([^"]*)"$/ do |title|
  @meeting_manager ||= MeetingManager.new
  @meeting_fixture = @meeting_manager.create_meeting(:title => title, :date => Date.today-1)
end

def the_meetings
  @meetings || @meeting_manager.get_meetings
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

When /^I request all the ([^"]*) meetings$/ do |selector|
  @meetings = case selector
    when 'past'     then @meeting_manager.get_past_meetings
    when 'current'  then @meeting_manager.get_current_meetings
  end
end


Then /^I obtain the last meeting$/ do
  the_meeting.should == the_meetings.last
end

Then /^I obtain (\d+) meeting[s]?$/ do |size|
  the_meetings.length.should == size.to_i
end


When /^the meeting title is "([^"]*)"$/ do |expected_title|
  the_meeting.title.should == expected_title
end

When /^the meeting has no\s+([^"]*)$/ do |assoc|
  the_meeting.send(assoc.to_sym).should be_empty
end


When /^the\s+([^"]*)\s+meeting title is\s+"([^"]*)"$/ do |meeting_selector, expected_title|
  m = case meeting_selector
        when 'first'  then the_meetings.first
        when 'last'   then the_meetings.last
      end
  m.title.should == expected_title
end


When /^the meeting date is\s+([^"]*)$/ do |date_selector|
  expected_date = case date_selector
    when 'today'      then Date.today
    when 'yesterday'  then Date.today-1
  end
  the_meeting.date.should == expected_date
end
