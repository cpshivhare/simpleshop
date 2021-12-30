RSpec.shared_examples 'only authenticate user access' do |req|
  before do
    get req
  end

  it 'returns response' do
    expect(response).to have_http_status(401)
  end

  it 'returns message' do
    get req
    expect(json['error']).to include('You need to sign in or sign up before continuing')
  end
end
