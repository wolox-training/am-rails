require 'rails_helper'

describe BooksController do
  describe 'GET #index' do
    context 'without authentication' do
      before(:each) do
        get :index
      end

      it 'responses with 401' do
        expect(response).to have_http_status(:unauthorized)
      end

      it 'return a login error message' do
        error_message = {
          errors: ['You need to sign in or sign up before continuing.']
        }.to_json
        expect(response.body).to eq(error_message)
      end
    end

    context 'with authentication' do
      let(:resource) { create(:user) }
      let!(:books) { create_list(:book, 10) }

      before(:each) do
        request.headers.merge! resource.create_new_auth_token
        get :index
      end

      it 'responses with 200 status code' do
        expect(response).to have_http_status(:ok)
      end

      it 'responses with all books' do
        expect(assigns(:books).count).to eq(books.size)
      end
    end
  end

  describe 'GET #show' do
    let!(:book) { create(:book) }

    context 'without authentication' do
      before(:each) do
        get :show, params: { id: book.id }
      end

      it 'responses with 401' do
        expect(response).to have_http_status(:unauthorized)
      end

      it 'return a login error message' do
        error_message = {
          errors: ['You need to sign in or sign up before continuing.']
        }.to_json
        expect(response.body).to eq(error_message)
      end
    end

    context 'with authentication' do
      let(:resource) { create(:user) }

      before(:each) do
        request.headers.merge! resource.create_new_auth_token
        get :show, params: { id: book.id }
      end

      it 'responses with 200 status code' do
        expect(response).to have_http_status(:ok)
      end

      it 'responses with desired book' do
        expect(response.body).to be true
      end
    end
  end
end
