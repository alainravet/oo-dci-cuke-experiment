Given /^today is ([^"]*)$/ do |date|
  @today_date = Time.new(date).to_date
  Timecop.freeze @today_date.to_time
end

def when_to_date(today_or_yesterday)
  today_or_yesterday=='today' ?
      @today_date :
      @today_date-1
end
