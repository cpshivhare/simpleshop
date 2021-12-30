require 'rails_helper'

describe Api::V1::RegionsController, type: :request do
  let(:user) { create(:user) }
  let(:region) { create(:user) }

  it_behaves_like 'only authenticate user access', 'api/v1/regions'
  it_behaves_like 'success response with login', 'api/v1/regions'

  describe 'GET /index' do
    before do
      create_list(:region, 2)
      login_with_auth_header(user)
      get 'api/v1/regions'
    end

    it 'return response' do
      expect(json).to be_a(Array)
      expect(json[0].keys).to include('id', 'title', 'country', 'currency', 'tax', 'products')
    end
  end

  describe 'POST /create' do
    let(:region_params) { build(:region).attributes.except(:id, :created_at, :updated_at) }

    before do
      login_with_auth_header(user)
      post 'api/v1/regions', params: { region: region_params }
    end

    it 'response success' do
      expect(response).to have_http_status :success
    end
  end

  describe 'POST /create' do
    let(:region_params) { build(:region).attributes.except(:id, :created_at, :updated_at) }

    before do
      login_with_auth_header(user)
      post 'api/v1/regions', params: { region: region_params }
    end

    it 'response success' do
      expect(response).to have_http_status :success
    end
  end

  describe 'POST /show' do
    before do
      login_with_auth_header(user)
      get 'api/v1/regions', params: { id: region.id }
    end

    it 'response success' do
      expect(response).to have_http_status :success
    end
  end
end
