Rails.application.routes.draw do
  api_version(module: 'API/V1', path: {value: 'api/v1'}) do
    # devise_for :users  Commented out because devise is not used for login
    mount_devise_token_auth_for 'User', at: 'auth'

    resources :books, only: [:index, :show]
  end
end
