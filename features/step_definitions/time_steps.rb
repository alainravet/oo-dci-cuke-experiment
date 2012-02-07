Given /^today is ([^"]*)$/ do |date|
  @today_date = Time.new(date).to_date
  Timecop.freeze @today_date.to_time
end

def when_to_date(today_or_yesterday)
  case today_or_yesterday
    when 'yesterday'  then @today_date-1
    when 'today'      then @today_date
    when 'tomorrow'   then @today_date+1
  end
end
