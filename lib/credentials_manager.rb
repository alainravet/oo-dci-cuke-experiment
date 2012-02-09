class CredentialsManager

  @test_admin_creds = nil

  def initialize
    @credentials = []
    @credentials_h = {}
  end

  def authenticate(user_name, user_password)
    c = @credentials_h[user_name]
    c && c.password == user_password && c #.user
  end

  def add_credential_for(name, pwd, rights)
    Credential.new(name, pwd, rights).tap do |c|
      @credentials << c
      @credentials_h[name] = c

      @test_admin_creds ||= c if c.admin?
    end
  end

  def credentials
    @credentials.dup  # to prevent   .credentials << ...
  end

  def get_test_admin_creds
    @test_admin_creds
  end
end
