class User < Container::Base

  attr_reader :name, :password

  def initialize(name)
    @name = name
  end

  has_many :talks, :proposals, :attendances

end