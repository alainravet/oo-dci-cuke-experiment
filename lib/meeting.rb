require_relative 'support/support'

class Meeting
  attr_reader :title, :date, :location, :hidden
  attr_accessor :talks

  def initialize(params)
    params.symbolize_keys!
    raise ObjectsManager::CreationError if params[:title].nil_or_blank?
    @title    = params.delete(:title)
    @date     = params.delete(:date)
    @location = params.delete(:location)
    @hidden   = params.delete(:hidden)=='true' || false # visible by default
    unless params.keys.empty?
      raise ObjectsManager::CreationError.new("invalid meeting properties : #{params.inspect}")
    end
    @talks = []
  end

  def visible?
    !@hidden
  end

  def attendees
    []
  end
end

class Meeting
  class Talk
  end
end