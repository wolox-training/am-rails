require 'rails_helper'

describe Api::V1::BookSuggestionsController do
  let(:user) { nil }

  describe 'POST #create' do
    subject(:http_response) do
      post :create, params: {
        book_suggestion: attributes_for(:book_suggestion, user: user)
      }
    end

    context('with authentication') do
      include_context 'authenticated user'

      it 'responses with :created status code' do
        is_expected.to have_http_status(:created)
      end

      it 'contains the user id setted' do
        expect(json_to_hash(http_response.body)['user_id']).to_not eq nil
      end
    end

    context 'without authentication' do
      it 'responses with :created status code' do
        is_expected.to have_http_status(:created)
      end

      it 'contains the user_id setted to null' do
        expect(json_to_hash(http_response.body)['user_id']).to eq nil
      end
    end

    %i[title author link publisher year].each do |field|
      context "without #{field}" do
        let(:http_response) do
          post :create, params: { book_suggestion: attributes_for(:book_suggestion, field => nil) }
        end

        it 'responses with bad request status code' do
          expect(http_response).to have_http_status(:bad_request)
        end
      end
    end
  end
end
