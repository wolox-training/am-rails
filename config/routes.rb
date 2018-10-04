Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  api_version(module: 'API/V1', path: {value: 'api/v1'}) do
    # devise_for :users  Commented out because devise is not used for login
    mount_devise_token_auth_for 'User', at: 'auth'

    resources :books, only: %i[index show]

    resources :users do
      resources :rents, only: %i[index create]
    end

    resources :book_suggestions, only: :create
    resources :info, only: :show, controller: :open_library
  end
end
