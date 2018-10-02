module Api
  module V1
    class ApiController < ApplicationController
      include Wor::Paginate

      protect_from_forgery with: :null_session
      before_action :authenticate_api_v1_user!

    end
  end
end
