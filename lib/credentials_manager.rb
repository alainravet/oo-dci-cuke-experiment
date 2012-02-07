class CredentialsManager

  attr_accessor :users

  def initialize
    @users = []
  end

  def authenticate(user_name, user_password)
    @users.detect{|u| u.name==user_name && u.password==user_password}
  end
end

