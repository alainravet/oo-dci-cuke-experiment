Given /^meetings with those properties:$/ do |table|
  # table is a | meeting 0 |pending
  @meeting_manager ||= MeetingManager.new
  table.hashes.each do |row|
    title = row[:title]
    date  = row[:when]=='today' ? today : yesterday
    @meeting_fixture = @meeting_manager.create_meeting(:title => title, :date => date)
  end
end

When /^I request the last meeting$/ do
  @meeting = @meeting_manager.get_meeting
end

When /^I request (all the|all the current|all the past) meetings$/ do |current_or_past|
  @meetings = case current_or_past
    when 'all the'          then @meeting_manager.get_meetings
    when 'all the past'     then @meeting_manager.get_past_meetings
    when 'all the current'  then @meeting_manager.get_current_meetings
  end
end


def the_meetings
  @meetings || @meeting_manager.get_meetings
end

def the_meeting
  @meeting || the_meetings.first
end
