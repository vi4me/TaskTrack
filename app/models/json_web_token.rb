class JsonWebToken

  def self.encode(payload)
    expiration = 2.weeks.from_now.to_i
    JWT.encode payload.merge(exp: expiration), Rails.application.credentials.fetch(:secret_key_base)
  end

  def self.decode(token)
    JWT.decode(token, Rails.application.credentials.fetch(:secret_key_base)).first
  end

end
# "token": "eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOjEyLCJleHAiOjE2MjE1MjYzNjR9.5gO520rBW0XfwmdNv04D3-moKZ3FLPG17PE0oBiDeRQ"
# {
#     "token": "eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOjEzLCJleHAiOjE2MjE1NzcwOTR9.BfcbZPyN05EB8Xn40ObH9wNtJeco_8ADiv0ZvJabKR4"
# }
