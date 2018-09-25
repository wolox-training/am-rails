Rails.application.routes.draw do
  # devise_for :users  Commented out because devise is not used for login
  mount_devise_token_auth_for 'User', at: 'auth'

  get '/books/', to: 'books#index'
  get '/books/:id', to: 'books#show'
  root to: 'books#index'
end
