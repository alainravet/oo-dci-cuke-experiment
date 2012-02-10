# Setup
############

When 'I try to create a meeting with $title, $location, and $date' do |title, location, when_|
  value = begin
    @new_meeting = Handler::Meeting::Creation.new(current_user_credentials).create(
        :title    => title,
        :location => location,
        :date     => when_to_date(when_)
    )

  rescue ObjectsManager::CreationError
    nil
  end
  cache_push :meeting, value
end

When /^I select the meeting titled "([^"]*)"$/ do |title|
  cache_push :meeting,
             Handler::Meeting::Retrieval.new(current_user_credentials).find_meeting_by_title(title)
end