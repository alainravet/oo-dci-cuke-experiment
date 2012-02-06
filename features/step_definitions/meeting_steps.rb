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
    when 'today'      then today
    when 'yesterday'  then yesterday
  end
  the_meeting.date.should == expected_date
end
