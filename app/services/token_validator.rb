class tokenValidator
  attr_reader email, app_token, client
  def initialize(args)
    @app_token = args[:app_token]
    @email = args[:email]
  end

  def call
    user = User.find_by(email: email)
    if user.present? && user.tokens.last == app_token && user.valid_token?(app_token, client)
      true
    else
      false
    end
  end
end