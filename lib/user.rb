class User

  attr_reader :name, :password, :rights

  def initialize(name, password, rights)
    @name, @password, @rights = name, password, rights
  end

  def admin?
    rights == :admin
  end

end