require 'rails_helper'

describe BooksController do
  describe 'GET #index' do
    before(:each) do
      get :index
    end

    context 'without authentication' do
      it 'responses with 401' do
        expect(response.status).to eq(401)
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
        get :index
      end

      it 'responses with 200' do
      end
    end
  end
end
