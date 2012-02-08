class User

  attr_reader :name, :password, :rights
  attr_accessor :attendances

  def initialize(name, password, rights)
    @name, @password, @rights = name, password, rights
    @attendances = []
  end

  def admin?
    rights == :admin
  end

  def add_attendance(meeting)
    @attendances << meeting
  end
end