Then /^I obtain (\d+) meeting[s]?$/ do |size|
  the_meetings.length.should == size.to_i
end


When /^the meeting title is "([^"]*)"$/ do |expected_title|
  the_meeting.title.should == expected_title
end

When /^the meeting has no\s+(attendees|talks)$/ do |assoc|
  the_meeting.send(assoc).should be_empty
end


When /^the\s+(first|last)\s+meeting title is\s+"([^"]*)"$/ do |first_or_last, expected_title|
  m = the_meetings.send(first_or_last)
  m.title.should == expected_title
end


When /^the meeting date is\s+(today|yesterday)$/ do |today_or_yesterday|
  the_meeting.date.should == when_to_date(today_or_yesterday)
end
