class Handler::Base

  def initialize(user)
    @user = user
  end


  def user_admin?
    @user && @user.admin?
  end

  def raise_authorization_error_if_not(condition, msg)
    return if condition
    raise ::AuthorizationError.new(msg)
  end

  def raise_authorization_error_if(condition, msg)
    return unless condition
    raise ::AuthorizationError.new(msg)
  end

  def raise_creation_error_if_not(condition, msg)
    return if condition
    raise ObjectsManager::CreationError.new(msg)
  end

  def raise_creation_error_if(condition, msg)
    return unless condition
    raise ObjectsManager::CreationError.new(msg)
  end

end