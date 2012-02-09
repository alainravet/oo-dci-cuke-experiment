class Handler::TalkCreation < Handler::Base

  def create(author, meeting, title)
    Meeting::Talk.new(author, meeting, title).tap do |talk|
      meeting.add_talk talk
      author .add_talk talk
    end
  end

end