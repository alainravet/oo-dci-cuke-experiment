class MeetingManager
  def initialize
    @meetings = []
  end

  def get_meeting
    @meetings.last
  end

  def get_meetings
    @meetings
  end

  def get_past_meetings
    @meetings.select{|m| m.date < Date.today}
  end

  def get_current_meetings
    @meetings.select{|m| Date.today <=  m.date}
  end

  def create_meeting(params)
    Meeting.new(params).tap do |m|
      @meetings << m
    end
  end

end
