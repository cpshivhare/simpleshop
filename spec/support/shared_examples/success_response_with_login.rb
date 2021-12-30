require 'devise/jwt/test_helpers'

RSpec.shared_examples 'success response with login' do |req, http_req_type|
  http_req_type ||= 'get'
  it 'returns http success' do
    login_with_auth_header(user)
    send(http_req_type, req)
    expect(response).to have_http_status(:success)

    # headers = { 'Accept' => 'application/json', 'Content-Type' => 'application/json' }
    # # This will add a valid token for `user` in the `Authorization` header
    # auth_headers = Devise::JWT::TestHelpers.auth_headers(headers, create(:user))
    # request_with_auth_header(create(:user)) do |headers|
    #   get req, headers: headers
    # end
  end
end
