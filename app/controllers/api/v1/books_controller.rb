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

      def info
        isbn = params[:isbn]
        return render json: { error: 'Please provide an ISBN code' } if isbn.nil?

        book = OpenLibraryService.new(isbn).book_info
        render json: book
      rescue RuntimeError => e
        render json: { error: e.to_s }
      end
    end
  end
end
