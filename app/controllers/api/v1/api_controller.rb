module Api
  module V1
    class ApiController < ApplicationController
      include Wor::Paginate

      protect_from_forgery with: :null_session
      before_action :authenticate_api_v1_user!
      before_action :set_locale

      def set_locale
        I18n.locale = current_api_v1_user.locale || I18n.default_locale
      end
    end
  end
end
