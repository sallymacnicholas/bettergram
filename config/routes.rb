Rails.application.routes.draw do
  root 'home#show'

  get '/auth/instagram', as: :login
  get '/auth/instagram/callback', to: 'sessions#create'
  get 'dashboard/feed', to: 'dashboard#index'
  get 'dashboard/trending', to: 'dashboard#trending'
  get '/profile', to: 'profile#show'
  resources :dashboard, only: [:show]


  delete '/logout', as: :logout, to: 'sessions#destroy'

  resources :profile, only: [:show]
  resources :stats, only: [:index]

  match '/404', to: 'errors#file_not_found', via: :all
  match '/422', to: 'errors#unprocessable', via: :all
  match '/500', to: 'errors#internal_server_error', via: :all
end
