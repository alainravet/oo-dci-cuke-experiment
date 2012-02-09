Transform /^-?(no|\d+)$/ do |number|
  number.to_i
end

Transform /^the meeting titled "[^"]*"$/ do |step_arg|
  title   = /"[^"]*"$/.match(step_arg)[0].dequote
  meeting = $objects_manager.meetings.detect{|m| m.title == title}
end


Transform /^(valid|invalid) credentials$/ do |step_arg|
  valid_or_invalid   = /(valid|invalid)/.match(step_arg)[0]
  credentials = valid_or_invalid=='valid' ?
      ['plain-joe', 'secret'] :
      ['plain-joe', 'invalid password']
end

