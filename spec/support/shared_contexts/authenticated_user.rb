shared_context 'authenticated user' do
  let(:user) { create(:user) }

  before(:each) do
    request.headers.merge! user.create_new_auth_token
  end
end
