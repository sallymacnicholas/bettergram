Rails.application.routes.draw do
  root 'home#show'

  get '/auth/instagram', as: :login
  get '/auth/instagram/callback', to: 'sessions#create'
  delete '/logout', as: :logout, to: 'sessions#destroy'

  resources :dashboard, only: [:index, :show]

  resources :popular_media, only: [:index]

  get '/profile', to: 'profile#show'

  resources :stats, only: [:index]
end
