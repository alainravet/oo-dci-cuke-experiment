require_relative '_app'

class App

  class << self

    def start_services
      @session_manager      = SessionManager.new
      @objects_manager      = ObjectsManager.new
      @credentials_manager  = CredentialsManager.new
    end

    attr_reader :credentials_manager
    attr_reader :objects_manager
    attr_reader :session_manager
  end

end