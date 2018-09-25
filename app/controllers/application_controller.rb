class ApplicationController < ActionController::Base
  include DeviseTokenAuth::Concerns::SetUserByToken

  # TODO: To revise when we start active admin or when we have an api_contrller
  protect_from_forgery with: :null_session
  # protect_from_forgery with: :exception
end
