class Meeting
  attr_reader :title, :date

  def initialize(params)
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