module Handler::Meeting
  class Retrieval < Handler::Base

    def get_meetings
      current_user_admin? ?
        meetings :
        meetings.select(&:visible?)
    end

    def get_current_meetings
      criterion = lambda{|m| Date.today <= m.date }
      find_all_meetings_and_filter(criterion)
    end

    def get_past_meetings
      criterion = lambda{|m| m.date < Date.today}
      find_all_meetings_and_filter(criterion)
    end

    def get_future_meetings
      criterion = lambda{|m| Date.today < m.date }
      find_all_meetings_and_filter(criterion)
    end

    def find_meeting_by_title(title)
      criterion = lambda{|m| m.title == title }
      find_meeting_and_filter(criterion)
    end

  private

    def find_all_meetings_and_filter(criterion)
      current_user_admin? ?
        meetings.select(&criterion) :
        meetings.select(&criterion).select(&:visible?)
    end


    def find_meeting_and_filter(criterion)
      meetings.detect(&criterion).tap do |m|
        return if m.nil?
        return unless m.visible? || current_user_admin?
      end
    end

    def meetings
      App.objects_manager.meetings
    end
  end
end
