Given /^a meeting is created with those properties:$/ do |table|
  row = table.hashes.first
  @it = create_meeting_from_params(row)
end

When /^a meeting is created$/ do
  @it = create_meeting_from_params(valid_meeting_attributes)
end

Given /^meetings with those properties:$/ do |table|
  $session_manager.as_admin do
    table.hashes.each do |row|
      create_meeting_from_params(row)
    end
  end
end

When /^I request (all the|all the current|all the past|all the future) meetings$/ do |current_or_past|
  @they = @meetings = case current_or_past
    when 'all the'          then $objects_manager.get_meetings
    when 'all the past'     then $objects_manager.get_past_meetings
    when 'all the current'  then $objects_manager.get_current_meetings
    when 'all the future'   then $objects_manager.get_future_meetings
  end
end


Given /^a meeting$/ do
  @it = @meeting = $objects_manager.get_meetings.last
  raise RuntimeError.new("Initialization error : no meeting found") if @meeting.nil?
end

def the_meetings
  @meetings || $objects_manager.get_meetings
end

def the_meeting
  @meeting || the_meetings.first
end

private

  def create_meeting_from_params(row)
    row.keys.select { |k| k=~/^_.+_$/ }.each do |raw_key|
      key = raw_key[/_(.+)_/, 1].to_sym # _date_ -> :date
      row[key] = when_to_date(row.delete(raw_key))
    end
    $objects_manager.create_meeting(row)
  end


  def valid_meeting_attributes
    @counter ||= 0 ; @counter += 1
    { :title => "fake-title-#{@counter}"
    }
  end
