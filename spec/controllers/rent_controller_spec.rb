require 'rails_helper'

describe Api::V1::RentsController do
  describe 'GET #index own rents' do
    subject(:http_request) do
      get :index, params: { user_id: user.id }
    end

    let!(:rents) { create_list(:rent, 10, user_id: user.id) }

    context 'with authentication' do
      include_context 'authenticated user'

      it 'responses with 200 status code' do
        is_expected.to have_http_status(200)
      end

      it 'respond with users rents' do
        expect(decompose_paginated_json(http_request.body).size).to eq(rents.size)
      end
    end

    context 'without authentication' do
      let(:user) { create(:user) }
      it 'responses with status code' do
        is_expected.to have_http_status(:unauthorized)
      end
    end
  end

  describe 'GET #index other users rents' do
    subject(:http_request) do
      get :index, params: { user_id: user2.id }
    end

    let(:user2) { create(:user) }
    let!(:rents) { create_list(:rent, 2, user_id: user2.id) }

    context 'with authentication' do
      include_context 'authenticated user'

      it 'responses with unauthorized status code' do
        is_expected.to have_http_status(:unauthorized)
      end
    end
  end

  describe 'POST #create' do
    subject(:http_request) do
      post :create, params: {
        user_id: user.id,
        rent: attributes_for(:rent, user_id: user.id, book_id: book.id)
      }
    end

    let(:book) { create(:book) }

    context 'with authentication' do
      include_context 'authenticated user'

      it 'responses with created status code' do
        is_expected.to have_http_status(:created)
      end

      it 'creates a new rent' do
        expect { http_request }.to change(Rent, :count).by(1)
      end
    end

    context 'without authentication' do
      let(:user) { create(:user) }
      include_examples 'Unauthorized examples'
    end
  end
end
