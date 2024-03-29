class ObjectsManager < Model::Base

  class CreationError < RuntimeError ; end

  has_many :meetings

  def create_meeting(params)
    Handler::Meeting::Creation.new(current_user_credentials).create(params)
  end

end