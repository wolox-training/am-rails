require 'rails_helper'

describe Api::V1::BookSuggestionsController do
  describe 'POST #create with authentication' do
    subject(:response) do
      post :create, params: {
        book_suggestion: attributes_for(:book_suggestion, user_id: user.id)
      }
    end

    include_context 'authenticated user'

    it 'responses with :created status code' do
      is_expected.to have_http_status(:created)
    end

    it 'contains the user id setted' do
      expect(json_to_hash(subject.body)['user_id']).to_not eq nil
    end
  end

  describe 'without authentication' do
    subject(:response) do
      post :create, params: {
        book_suggestion: attributes_for(:book_suggestion)
      }
    end

    it 'responses with :created status code' do
      is_expected.to have_http_status(:created)
    end

    it 'contains the user_id setted to null' do
      expect(json_to_hash(subject.body)['user_id']).to eq nil
    end
  end
end
