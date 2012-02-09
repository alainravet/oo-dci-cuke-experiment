class User

  attr_reader :name, :password, :attendances, :proposals, :talks

  def initialize(name)
    @name = name
    @attendances = []
    @proposals   = []
    @talks       = []
  end

  def add_attendance(meeting) @attendances << meeting end
  def add_proposal(p)         @proposals << p         end
  def add_talk(t)             @talks << t             end

  def remove_proposal(p);     @proposals.delete(p)    end

end