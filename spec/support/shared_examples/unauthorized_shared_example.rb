shared_examples 'Unauthorized examples' do
  it { expect(response).to have_http_status(:unauthorized) }

  it 'return a login error message' do
    error_message = {
      errors: ['You need to sign in or sign up before continuing.']
    }.to_json
    expect(response.body).to eq(error_message)
  end
end
