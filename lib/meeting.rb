require_relative 'support/support'

class Meeting
  attr_reader :title, :date
  attr_accessor :talks

  def initialize(params)
    raise ObjectsManager::CreationError if params[:title].nil_or_blank?
    @title = params[:title]
    @date  = params[:date]
    @talks = []
  end

  def attendees
    []
  end
end

class Meeting
  class Talk
  end
end