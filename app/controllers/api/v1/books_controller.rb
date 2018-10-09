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

      def info
        isbn = params[:isbn]
        return render json: { error: t('.no_isbn') }, status: :bad_request if isbn.nil?

        book_info = OpenLibraryService.new(isbn).book_info
        return render json: { error: t('.no_book_error', code: isbn) }, status: :not_found if
          book_info.empty?

        render json: book_info
      end
    end
  end
end
