module Api
  module V1
    class ApiController < ApplicationController
      include Wor::Paginate
      include DeviseTokenAuth::Concerns::SetUserByToken
      include Pundit

      protect_from_forgery with: :null_session
      before_action :authenticate_api_v1_user!
      rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
      rescue_from ActionController::ParameterMissing, with: :missing_parameter

      private

      def pundit_user
        current_api_v1_user
      end

      def user_not_authorized
        render json: { error: 'Not authorized' }, status: :unauthorized
      end

      def missing_parameter(exception)
        render json: { error: exception.to_s }, status: :bad_request
      end
    end
  end
end
