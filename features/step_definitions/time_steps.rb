def when_to_date(today_or_yesterday)
  case today_or_yesterday
    when 'yesterday'  then @today_date-1
    when 'today'      then @today_date
    when 'tomorrow'   then @today_date+1
  end
end
