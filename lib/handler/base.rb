class Handler::Base

  def initialize(user_or_credentials)
    @user_credentials = user_or_credentials
  end


  def user_admin?
    @user_credentials && @user_credentials.admin?
  end

  def current_user
    @user_credentials && @user_credentials.user
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