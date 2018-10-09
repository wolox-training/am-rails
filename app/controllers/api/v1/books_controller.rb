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

        if book == {}
          render json: { error: "No book found with code #{isbn}" }
        else
          render json: book
        end
      end
    end
  end
end
