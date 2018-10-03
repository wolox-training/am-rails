module Api
  module V1
    class ApiController < ApplicationController
      include Wor::Paginate
      include DeviseTokenAuth::Concerns::SetUserByToken
      include Pundit

      protect_from_forgery with: :null_session
      before_action :authenticate_api_v1_user!
      before_action :set_locale

      rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

      private

      def set_locale
        I18n.default_locale = current_api_v1_user.locale || :en
      end

      def pundit_user
        current_api_v1_user
      end

      def user_not_authorized
        render json: { error: 'Not authorized' }, status: :unauthorized
      end
    end
  end
end
