module Api
  module V1
    class ApiController < ApplicationController
      include Wor::Paginate

      # protect_from_forgery with: :null_session
      protect_from_forgery with: :exception
      before_action :authenticate_api_v1_user!
    end
  end
end
