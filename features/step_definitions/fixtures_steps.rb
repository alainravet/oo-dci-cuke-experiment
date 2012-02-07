Given /^meetings with those properties:$/ do |table|
  table.hashes.each do |row|
    row.keys.select{|k| k=~/^_.+_$/}.each do |raw_key|
      key = raw_key[/_(.+)_/,1].to_sym    # _date_ -> :date
      row[key] = when_to_date(row.delete(raw_key))
    end
    @objects_manager.create_meeting(row)
  end
end

When /^I request (all the|all the current|all the past|all the future) meetings$/ do |current_or_past|
  @they = @meetings = case current_or_past
    when 'all the'          then @objects_manager.get_meetings
    when 'all the past'     then @objects_manager.get_past_meetings
    when 'all the current'  then @objects_manager.get_current_meetings
    when 'all the future'   then @objects_manager.get_future_meetings
  end
end


Given /^a meeting$/ do
  @it = @meeting = @objects_manager.get_meetings.last
  raise RuntimeError.new("Initialization error : no meeting found") if @meeting.nil?
end

def the_meetings
  @meetings || @objects_manager.get_meetings
end

def the_meeting
  @meeting || the_meetings.first
end
