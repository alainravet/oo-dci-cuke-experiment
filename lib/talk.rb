class Talk

  attr_reader :author, :meeting, :title

  def initialize(author, meeting, title)
    @author   = author
    @meeting  = meeting
    @title    = title
  end

end