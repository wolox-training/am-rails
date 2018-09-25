class ApplicationController < ActionController::Base
  # TODO: To revise when we start active admin or when we have an api_contrller
  # protect_from_forgery with: :null_session
  include DeviseTokenAuth::Concerns::SetUserByToken
  protect_from_forgery prepend: true
end
