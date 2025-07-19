module AuthHelpers
  def auth_headers(user)
    token = Warden::JWTAuth::UserEncoder.new.call(user, :user, nil).first
    {
      "Authorization" => "Bearer #{token}",
      "Accept" => "application/vnd.api+json",
      "Content-Type" => "application/vnd.api+json"
    }
  end
end
