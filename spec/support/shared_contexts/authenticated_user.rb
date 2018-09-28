shared_context 'authenticated user' do
  let(:resource) { create(:user) }

  before(:each) do
    request.headers.merge! resource.create_new_auth_token
  end
end
