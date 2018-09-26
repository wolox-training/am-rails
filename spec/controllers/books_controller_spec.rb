require 'rails_helper'

shared_context 'Authenticated User' do
  let(:user) { create(:user) }
  let!(:access_data) { AuthenticableEntity.generate_access_token(user) }
  let!(:access_token) { access_data[:token] }
  let!(:renew_id) { access_data[:renew_id] }

  before do
    request.headers['Authorization'] = access_token
  end
end

describe BooksController do
  include_context 'Authenticated User'

  describe 'GET #index' do
    # context 'When fetching all the books' do
    #   let!(:rents) { create_list(:book, 3) }
    #   before do
    #     get :index
    #   end

      it 'responses with all the books json' do
    #     expected = ActiveModel::Serializer::CollectionSerializer.new(
    #       books, each_serializer: BookSerializer
    #     ).to_json
    #     expect(response_body.to_json) =~ JSON.parse(expected)
    #   end
    end
  end
end
