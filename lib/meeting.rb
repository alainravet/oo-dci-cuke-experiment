require_relative 'support/support'

class Meeting
  attr_reader :title, :date, :location, :hidden, :attendees, :talks

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
  end

  def visible?
    !@hidden
  end

  def past?
    date < Time.now.to_date
  end

  def add_attendee(user); @attendees << user end
  def add_talk(talk)    ; @talks     << talk end
end

class Meeting
  class Talk
  end
end