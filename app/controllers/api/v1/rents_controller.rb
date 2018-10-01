module Api
  module V1
    class RentsController < ApiController
      def create
        @rent = Rent.new(rent_params)
        if @rent.save
          render json: @rent, status: :created
        else
          render json: { error: @rent.errors.messages }
        end
      end

      def index
        user_id = params[:user_id].to_i

        if user_id != current_api_v1_user.id
          render json: { error: 'Cant access rents from other user' }, status: :unauthorized
        else
          @rents = Rent.where user_id: user_id
          render_paginated @rents
        end
      end

      private

      def rent_params
        params.require(:rent).permit(:from_date, :to_date, :user_id, :book_id)
      end
    end
  end
end
