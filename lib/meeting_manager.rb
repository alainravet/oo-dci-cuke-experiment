class MeetingManager
  def initialize
    @meetings = []
  end

  def get_meeting
    @meetings.last
  end

  def create_meeting(params)
    Meeting.new(params).tap do |m|
      @meetings << m
    end
  end
end
