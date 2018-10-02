module Api
  module V1
    class ApiController < ApplicationController
      include Wor::Paginate
      include DeviseTokenAuth::Concerns::SetUserByToken

      protect_from_forgery with: :null_session
      before_action :authenticate_api_v1_user!
      before_action :set_locale

      def set_locale
        I18n.default_locale = current_api_v1_user.locale || :en
      end
    end
  end
end
