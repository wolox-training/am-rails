require 'rails_helper'

describe Api::V1::RentsController do
  describe 'GET #index own rents' do
    subject(:response) do
      get :index, params: { user_id: user.id }
    end

    let!(:rents) { create_list(:rent, 10, user_id: user.id) }

    context 'with authentication' do
      include_context 'authenticated user'

      it do
        is_expected.to have_http_status(200)
      end

      it 'respond with users rents' do
        expect(decompose_paginated_json(response.body).size).to eq(rents.size)
      end
    end

    context 'without authentication' do
      let!(:user) { create(:user) }
      it do
        is_expected.to have_http_status(:unauthorized)
      end
    end
  end

  describe 'GET #index other users rents' do
    subject(:response) do
      get :index, params: { user_id: user2.id }
    end

    let!(:user2) { create(:user) }
    let!(:rents) { create_list(:rent, 10, user_id: user2.id) }

    context 'with authentication' do
      include_context 'authenticated user'

      it do
        is_expected.to have_http_status(:unauthorized)
      end
    end
  end

  describe 'POST #create' do
    subject(:response) do
      post :create, params: {
        user_id: user.id,
        rent: attributes_for(:rent, user_id: user.id)
      }
    end

    context 'with authentication' do
      include_context 'authenticated user'

      # TODO: see how to handle the no redis server error
      xit do
        is_expected.to have_http_status(:created)
      end
    end
  end
end
