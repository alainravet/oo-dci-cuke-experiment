Given /^today is ([^"]*)$/ do |date|
  Timecop.freeze Time.new(date).to_date.to_time
end

def today    ; Date.today   end
def yesterday; Date.today-1 end
