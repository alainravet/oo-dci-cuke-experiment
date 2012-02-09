Transform /^-?(no|\d+)$/ do |number|
  number.to_i
end

Transform /^the meeting titled "[^"]*"$/ do |step_arg|
  title   = /"[^"]*"$/.match(step_arg)[0].dequote
  meeting = $objects_manager.meetings.detect{|m| m.title == title}
end

