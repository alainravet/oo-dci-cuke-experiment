class Credential

  attr_reader :name, :password, :rights, :user

  def initialize(name, password, rights, user=User.new(name))
    @name, @password, @rights = name, password, rights
    @user = user
  end

  def admin?
    rights == :admin
  end

end