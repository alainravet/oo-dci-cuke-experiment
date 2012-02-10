# Setup :
#------------


# Tests :
#------------

When /^it was found$/ do
  c_it.should be
end

When /^it was not found$/ do
  c_it.should_not be
end



# Ex: Then I obtain no meeting
# Ex: Then I obtain 3 meetings
Then /^I obtain (no|\d+) (\w+)s?$/ do |expected_size, base_models|
  base_models << 's' unless base_models.end_with?('s')      # talk -> talks
  cache_get(base_models).length.should == expected_size
end



Then /^I obtain (\d+) (\w+)s? with the (\w+)s (.*)$/ do |expected_size, base_models, property, titles|
  base_models << 's' unless base_models.end_with?('s')      # talk -> talks
  step "I obtain #{expected_size} #{base_models}"
  titles = titles.split(/\s*,\s*/).collect(&:dequote)
  cache_get(base_models).collect(&:"#{property}").should == titles
end



# Ex: Then the meeting has no talks
# Ex: Then the meeting has 1 talk
Then /^the (\w+) has (no|\d+) (\w+)s?$/ do |base_model, expected_size, assoc|
  assoc << 's' unless assoc.end_with?('s')      # talk -> talks
  eval("cache_get(:#{base_model}).send(:#{assoc}).length").should == expected_size
end

# Ex: Then it has 1 talk
# Ex: Then it has no attendees
Then /^it has (no|\d+) (\w+)s?$/ do |size, assoc|
  assoc << 's' unless assoc.end_with?('s')      # talk -> talks
  c_it.send("#{assoc}").size.should == size
end

# Ex: Then I have 1 attendance
# Ex: Then I have no attendances
Then /^I have (no|\d+) (\w+)s?$/ do |size, assoc|
  user = current_user
  assoc << 's' unless assoc.end_with?('s')      # talk -> talks
  user.send("#{assoc}").size.should == size
end


# Ex: Then I have 1 proposal titled "Cucumber for dummies"
Then /^I have 1 (talk|proposal) titled "(.*)"/ do |assoc, title|
  success = current_user.send("#{assoc}s").detect{|p| p.title==title}
  unless success
    fail "the current user has no #{assoc} titled #{title.inspect}"
  end
end

Then /^the meeting has 1 (talk|proposal) titled "(.*)"/ do |assoc, title|
  success = cache_get(:meeting).send("#{assoc}s").detect{|p| p.title==title}
  unless success
    fail "the current meeting has no #{assoc} titled #{title.inspect}"
  end
end


# Ex: Then its title is "meeting 2"
# Ex: Then its date  is tomorrow
Then /^its (\w+)\s+is (.*)$/ do |property, expected_value|
  if %w(date).include?(property)
    expected = when_to_date(expected_value)
  end
  c_it.send(property).should == expected_value.dequote

end


Then /^it is a (success|failure)$/ do |outcome|
  outcome == "success" ?
    c_it.should(be) :
    c_it.should_not( be)
end

Then /^it is (valid|invalid)$/ do |valid_or_invalid|
  if valid_or_invalid=='valid' && c_it.nil?
    fail 'the object could not created'
  elsif valid_or_invalid=='invalid' && c_it
    fail "the object should not have been created #{c_it.inspect}" if c_it
  end
end


Then /^it is (hidden|visible|not visible)$/ do |flag|
  flag=='visible' ?
    c_it.should(be_visible) :
    c_it.should_not(be_visible)
end

Then /^it is nil$/ do
  c_it.should_not be
end

Then /^it is\s+(\w+),(.+)$/ do | arg0, args|
  requirements = "#{arg0},#{args}".split(/,\s*/)
  requirements.each do |req|
    if %w(valid invalid).include?(req)
      step "it is #{req}"

    elsif c_it.respond_to?(req)
      fail "the record should be #{req}" unless c_it.send(req)
    elsif c_it.respond_to?("#{req}?")
      fail "the record should be #{req}" unless c_it.send("#{req}?")
    else
      raise RuntimeError.new("unknown property : #{req} for #{c_it.inspect}")
    end
  end
end
