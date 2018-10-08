shared_examples 'Unauthorized examples' do
  it { is_expected.to have_http_status(:unauthorized) }
end
