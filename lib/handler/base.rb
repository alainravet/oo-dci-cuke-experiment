class Handler::Base

  def initialize(user_credentials)
    @user_credentials = user_credentials
  end


  def current_user_admin?
    @user_credentials && @user_credentials.admin?
  end

  def current_user
    @user_credentials && @user_credentials.user
  end

  def raise_authorization_error_if_not(ok_condition, msg)
    return if ok_condition
    raise ::AuthorizationError.new(msg)
  end

  def raise_authorization_error_if(fail_condition, msg)
    return unless fail_condition
    raise ::AuthorizationError.new(msg)
  end

  def raise_creation_error_if_not(ok_condition, msg)
    return if ok_condition
    raise ObjectsManager::CreationError.new(msg)
  end

  def raise_creation_error_if(fail_condition, msg)
    return unless fail_condition
    raise ObjectsManager::CreationError.new(msg)
  end

end