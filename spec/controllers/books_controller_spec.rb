require 'rails_helper'

describe Api::V1::BooksController do
  describe 'GET #index' do
    subject(:http_response) do
      get :index
    end

    let!(:books) { create_list(:book, 10) }

    context 'with authentication' do
      include_context 'authenticated user'

      it 'responses with 200 status code' do
        is_expected.to have_http_status(:ok)
      end

      it 'responses with all books' do
        expect(decompose_paginated_json(http_response.body).size).to eq(books.size)
      end
    end

    context 'without authentication' do
      include_examples 'Unauthorized examples'
    end
  end

  describe 'GET #show' do
    subject(:http_response) do
      get :show, params: { id: book.id }
    end

    let!(:book) { create(:book) }

    context 'with authentication' do
      include_context 'authenticated user'

      it 'responses with 200 status code' do
        is_expected.to have_http_status(:ok)
      end

      it 'responses with desired book' do
        expect(http_response.body).to eq(BookSerializer.new(book).to_json)
      end
    end

    context 'without authentication' do
      include_examples 'Unauthorized examples'
    end
  end
end
