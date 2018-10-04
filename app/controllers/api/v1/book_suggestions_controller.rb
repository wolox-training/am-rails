module Api
  module V1
    class BookSuggestionsController < ApiController
      skip_before_action :authenticate_api_v1_user!, only: :create

      def create
        book_suggestion = BookSuggestion.new(book_suggestion_params)
        book_suggestion.user = current_api_v1_user if current_api_v1_user

        if book_suggestion.save
          render json: book_suggestion, status: :created
        else
          render json: { error: book_suggestion.errors.messages }, status: :bad_request
        end
      end

      private

      def book_suggestion_params
        params.require(:book_suggestion).permit(%i[title author link publisher year synopsis
                                                   price])
      end
    end
  end
end
