module Api
  module V1
    class BooksController < ApiController
      def show
        book = Book.find(params[:id])
        render json: book
      end

      def index
        render_paginated Book
      end
    end
  end
end
