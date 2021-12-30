require 'rails_helper'

describe Api::SessionsController, type: :request do
  let(:user) { create(:user) }
  let(:login_url) { '/api/sign_in' }
  let(:logout_url) { 'api/sign_out' }

  context 'When logging in' do
    before do
      login_with_auth_header(user)
    end

    it 'returns a token' do
      expect(response.headers['Authorization']).to be_present
    end

    it 'returns 200' do
      expect(response.status).to eq(200)
    end

    it 'return success response' do
      expect(json.keys).to include(*%w[message data])
    end
  end

  context 'When password is missing' do
    before do
      post login_url, params: {
        user: {
          email: user.email,
          password: nil
        }
      }
    end

    it 'returns 401' do
      expect(response.status).to eq(401)
    end
  end

  context 'When logout ' do
    it 'returns 200' do
      delete logout_url

      expect(response).to have_http_status(200)
    end
  end
end
