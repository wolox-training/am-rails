shared_examples 'Unauthorized examples' do
  it { expect(response).to have_http_status(:unauthorized) }
end
