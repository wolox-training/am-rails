module Api
  module V1
    class RentsController < ApiController
      def create; end

      def index_user
        @rents = Rent.where user_id: params[:user_id].to_i
        render_paginated @rents
      end

      def index_book
        @rents = Rent.where book_id: params[:book_id].to_i
        render_paginated @rents
      end
    end
  end
end
