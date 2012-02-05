class Meeting
  attr_reader :title

  def initialize(params)
    @title = params[:title]
  end

  def attendees
    []
  end

  def talks
    []
  end
end