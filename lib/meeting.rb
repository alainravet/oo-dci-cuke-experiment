require_relative 'support/support'

class Meeting
  attr_reader :title, :date, :location, :hidden, :attendees, :talks, :proposals

  def initialize(params)
    raise ObjectsManager::CreationError if params[:title].nil_or_blank?
    @title    = params.delete(:title)
    @date     = params.delete(:date)
    @location = params.delete(:location)
    @hidden   = params.delete(:hidden)=='true' || false # visible by default
    unless params.keys.empty?
      raise ObjectsManager::CreationError.new("invalid meeting properties : #{params.inspect}")
    end
    @talks = []
    @attendees = []
    @proposals = []
  end

  def visible?
    !@hidden
  end

  def past?
    date < Time.now.to_date
  end

  def add_attendee(user); @attendees << user end
  def add_proposal(p)   ; @proposals << p    end
  def add_talk(talk)    ; @talks     << talk end

  def remove_proposal(p); @proposals.delete(p) end

end

class Meeting

  class Talk
    attr_reader :author, :meeting, :title
    def initialize(author, meeting, title)
      @author   = author
      @meeting  = meeting
      @title    = title
    end
  end

  class Proposal
    attr_reader :author, :meeting, :title
    def initialize(author, meeting, title)
      @author   = author
      @meeting  = meeting
      @title    = title
    end
  end

end