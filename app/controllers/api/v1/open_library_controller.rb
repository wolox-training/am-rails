module Api
  module V1
    class OpenLibraryController < ApiController
      # skip_before_action :authenticate_api_v1_user!, only: :show

      def show
        @book = OpenLibraryService.book_info params[:id]
        render json: @book
      end
    end
  end
end
