class User

  attr_reader :name, :password, :rights, :attendances, :proposals

  def initialize(name, password, rights)
    @name, @password, @rights = name, password, rights
    @attendances = []
    @proposals   = []
  end

  def admin?
    rights == :admin
  end

  def add_attendance(meeting)
    @attendances << meeting
  end

  def add_proposal(p)
    @proposals << p
  end
end