class Handler::TalkCreation < Handler::Base

  def create(meeting)
    Meeting::Talk.new.tap do |talk|
      meeting.add_talk talk
    end
  end

end