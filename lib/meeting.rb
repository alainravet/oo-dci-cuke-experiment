require_relative 'support/support'

class Meeting
  attr_reader :title, :date

  def initialize(params)
    raise ObjectsManager::CreationError if params[:title].nil_or_blank?
    @title = params[:title]
    @date  = params[:date]
  end

  def attendees
    []
  end

  def talks
    []
  end
end