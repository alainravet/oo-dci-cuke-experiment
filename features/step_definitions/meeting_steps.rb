# Setup
############

When 'I try to create a meeting with $title, $location, and $date' do |title, location, when_|
  @it = begin
    @new_meeting = Handler::Meeting::Creation.new(current_user).create(
        :title    => title,
        :location => location,
        :date     => when_to_date(when_)
    )
  rescue ObjectsManager::CreationError
    nil
  end
end

When /^I select the meeting titled "([^"]*)"$/ do |title|
  @it = @meeting = Handler::Meeting::Retrieval.new(current_user).find_meeting_by_title(title)
end