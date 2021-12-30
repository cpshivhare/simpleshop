require 'devise/jwt/test_helpers'
require 'factory_bot_rails'

module RequestHelper
  def request_with_auth_header(user)
    headers = { 'Accept' => 'application/json', 'Content-Type' => 'application/json' }
    # This will add a valid token for `user` in the `Authorization` header
    auth_headers = Devise::JWT::TestHelpers.auth_headers(headers, user)
    yield(auth_headers)
  end
end
