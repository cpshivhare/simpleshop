module ApiHelpers
  def json
    JSON.parse(response.body)
  end

  def login_with_auth_header(user)
    post '/api/sign_in', params: {
      user: {
        email: user.email,
        password: user.password
      }
    }
  end

  def set_devise_mapping
    request.env['devise.mapping'] = Devise.mappings[:user]
  end
end
