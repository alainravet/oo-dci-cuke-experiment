# Setup :
#------------


When /^it has (\d+) (\w+)s?$/ do |size, assoc|
  assoc << 's' unless assoc.end_with?('s')      # talk -> talks
  @it.send("#{assoc}").size.should == size
end



# Tests :
#------------

# Ex: Then I obtain no meeting
# Ex: Then I obtain 3 meetings
Then /^I obtain (no|\d+) (\w+)s?$/ do |expected_size, base_models|
  base_models << 's' unless base_models.end_with?('s')      # talk -> talks
  eval("@#{base_models}.length").should == expected_size
end


# Ex: Then the meeting has no talks
# Ex: Then the meeting has 1 talk
Then /^the (\w+) has (no|\d+) (\w+)s$/ do |base_model, expected_size, assoc|
  assoc << 's' unless assoc.end_with?('s')      # talk -> talks
  eval("@#{base_model}.send(:#{assoc}).length").should == expected_size
end


# Ex: Then its title is "meeting 2"
# Ex: Then its date  is tomorrow
Then /^its (\w+)\s+is (.*)$/ do |property, expected_value|
  if %w(date).include?(property)
    expected = when_to_date(expected_value)
  end
  @it.send(property).should == expected_value

end


Then /^it is (valid|invalid)$/ do |valid_or_invalid|
  if valid_or_invalid=='valid' && @it.nil?
    fail 'the object could not created'
  elsif valid_or_invalid=='invalid' && @it
    fail "the object should not have been created #{@it.inspect}" if @it
  end
end


# Ex: And their properties are:
#         | title     |      _date_  |
#         | meeting 0 |    yesterday |
#         | meeting 1 |        today |
Then /^their properties are:$/ do |table|
  unless @they.length == table.hashes.length
    fail "wrong number of records : got #{table.hashes.length} but expected #{the_meetings.length}"
  end
  @they.each_with_index do |m, i|
    hash = table.hashes[i]
    hash.keys.each do |k|
      expected_value = hash[k]
      if k =~ /^_.+_$/
        key = k[/_(.+)_/,1].to_sym    # _date_ -> :date
        m.send(key).should == when_to_date(expected_value)
      else
        m.send(k).should == expected_value
      end
    end
  end
end