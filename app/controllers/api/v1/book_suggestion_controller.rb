module Api
  module V1
    class BookSuggestionController < ApiController
      def create
        @book_suggestion = BookSuggestion.new(book_suggestion_params)
        if @book_suggestion.save
          render json: @book_suggestion, status: :created
        else
          render json: { error: @book_suggestion.errors.messages }, status: :bad_request
        end
      end

      private

      def rent_params
        params.require(:book_suggestion).permit(:title, :author, :link)
      end
    end
  end
end
