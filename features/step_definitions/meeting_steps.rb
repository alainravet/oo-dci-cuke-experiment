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

When /^the meetings? (?:has|have) those properties:$/ do |table|
  unless the_meetings.length == table.hashes.length
    fail "wrong number of meetings : got #{table.hashes.length} but expected #{the_meetings.length}"
  end
  the_meetings.each_with_index do |m, i|
    hash = table.hashes[i]
    hash.keys.each do |k|
      expected_value = k=='when' ? when_to_date(hash[k]) : hash[k]
      if k=='when'
        m.date.should == when_to_date(hash[k])
      else
        m.send(k).should == hash[k]
      end
    end
  end
end

When /^I try to create a meeting with (.*), (.*), and (.*)$/ do |title, location, when_|
  @new_meeting = @objects_manager.create_meeting(
      :title    => title,
      :location => location,
      :date     => when_to_date(when_)
  )
end

Then /^the created meeting is (.*)$/ do |valid_or_invalid|
  case valid_or_invalid
    when 'valid'
      fail 'the meeting could not created' if @new_meeting.nil?
    when 'invalid'
      fail "the meeting should not have been created #{@new_meeting.inspect}" if @new_meeting
  end

end