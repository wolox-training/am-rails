module Api
  module V1
    class BooksController < ApiController
      def show
        book = Book.find(params[:id])
        render json: book
      end

      def index
        books = Book.all
        render_paginated books
      end
    end
  end
end
