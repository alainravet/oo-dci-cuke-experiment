require_relative 'meeting'

class ObjectsManager

  class CreationError < RuntimeError ; end

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

  def get_future_meetings
    @meetings.select{|m| Date.today < m.date }
  end

#----------

  def create_meeting(params)
    if find_meeting_by_title(params[:title])
      raise CreationError.new('the title must be unique')
    end
    Meeting.new(params).tap do |m|
      @meetings << m
    end
  rescue CreationError
    nil
  end

private
  def find_meeting_by_title(title)
    @meetings.detect{|m| m.title == title}
  end
end
