module Api
  module V1
    class RentsController < ApiController
      def create
        rent = Rent.new(rent_params)
        authorize rent

        if rent.save
          RentMailer.with(rent_id: rent.id).rent_confirmation.deliver_later
          render json: rent, status: :created
        else
          render json: { error: rent.errors.messages }
        end
      end

      def index
        user_id = params[:user_id].to_i
        authorize user_id, policy_class: UserPolicy
        render_paginated Rent.where user_id: user_id
      end

      private

      def rent_params
        params.require(:rent).permit(:from_date, :to_date, :user_id, :book_id)
      end
    end
  end
end
