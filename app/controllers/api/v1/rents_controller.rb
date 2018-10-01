module Api
  module V1
    class RentsController < ApiController
      def create
        @rent = Rent.new(rent_params)
        if @rent.save
          RentMailer.with(rent_id: @rent.id).rent_confirmation.deliver_later
          render json: @rent, status: :created
        else
          render json: { error: @rent.errors.messages }
        end
      end

      def index_user
        @rents = Rent.where user_id: params[:user_id].to_i
        render_paginated @rents
      end

      def index_book
        @rents = Rent.where book_id: params[:book_id].to_i
        render_paginated @rents
      end

      private

      def rent_params
        params.require(:rent).permit(:from_date, :to_date, :user_id, :book_id)
      end
    end
  end
end
