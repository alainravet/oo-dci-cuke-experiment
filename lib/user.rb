class User

  attr_reader :name, :password, :rights, :attendances, :proposals, :talks

  def initialize(name, password, rights)
    @name, @password, @rights = name, password, rights
    @attendances = []
    @proposals   = []
    @talks       = []
  end

  def admin?
    rights == :admin
  end

  def add_attendance(meeting) @attendances << meeting end
  def add_proposal(p)         @proposals << p         end
  def add_talk(t)             @talks << t             end

  def remove_proposal(p);     @proposals.delete(p)    end

end