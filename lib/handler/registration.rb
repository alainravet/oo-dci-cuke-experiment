class Handler::Registration < Handler::Base

  def register_for(meeting)
    return if @user.nil?
    return if meeting.past?
    return if meeting.attendees.include?(@user) # already registered

    @user   .add_attendance meeting
    meeting.add_attendee   @user
  end

end