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
        if isbn.nil?
          render json: { error: 'Please provide an ISBN code' }
          return
        end

        book = OpenLibraryService.new(isbn).book_info
        render json: book
      rescue RuntimeError => e
        render json: { error: e.to_s }
      else
      end
    end
  end
end
