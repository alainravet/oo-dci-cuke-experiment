class Handler::Registration < Handler::Base

  def register_for(meeting)
    return if @user_credentials.nil?
    return if meeting.past?

    candidate = current_user
    return if meeting.attendees.include?(candidate) # already registered

    candidate .add_attendance meeting
    meeting   .add_attendee   candidate
  end

end