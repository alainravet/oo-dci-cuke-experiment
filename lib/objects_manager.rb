require_relative 'meeting'

class ObjectsManager

  attr_reader :meetings

  class CreationError < RuntimeError ; end

  def initialize
    @meetings = []
  end

  def add_meeting(m)
    @meetings << m
  end

#----------

  def create_meeting(params)
    Handler::Meeting::Creation.new(current_user).create(params)
  end


end