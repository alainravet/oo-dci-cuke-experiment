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
    $session_manager.current_user_admin? ?
      @meetings :
      @meetings.select(&:visible?)
  end

  def get_past_meetings
    criterion = lambda{|m| m.date < Date.today}
    get_meetings_and_filter(criterion)
  end

  def get_current_meetings
    criterion = lambda{|m| Date.today <= m.date }
    get_meetings_and_filter(criterion)
  end

  def get_future_meetings
    criterion = lambda{|m| Date.today < m.date }
    get_meetings_and_filter(criterion)
  end

#----------

  def create_meeting(params)
    if find_meeting_by_title(params[:title])
      raise CreationError.new('the title must be unique')
    elsif !$session_manager.current_user_admin?
      raise CreationError.new('not authorized : only an admin can create a Meeting')
    else
      Meeting.new(params).tap do |m|
        @meetings << m
      end
    end
  rescue CreationError
    nil
  end

  def create_talk(meeting)
    Meeting::Talk.new.tap do |talk|
      meeting.talks << talk
    end
  end

private
  def get_meetings_and_filter(criterion)
    if $session_manager.current_user_admin?
      @meetings.select(&criterion)
    else
      @meetings.select(&criterion).select(&:visible?)
    end
  end

  def find_meeting_by_title(title)
    @meetings.detect{|m| m.title == title}
  end
end
