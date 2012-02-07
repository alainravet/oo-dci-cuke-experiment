When /^it has (\d+) (\w+)s?$/ do |size, assoc|
  assoc << 's' unless assoc.end_with?('s')      # talk -> talks
  @it.send("#{assoc}").size.should == size.to_i
end

