Rails.application.routes.draw do
  get '/auth/instagram/callback', to: 'sessions#create'
  get '/dashboard', to: 'dashboard#show'
  get '/dashboard/users/self/feed', to: 'dashboard#index'
  get '/profile', to: 'profile#show'
  get '/auth/instagram', as: :login
  delete '/logout', as: :logout, to: 'sessions#destroy'
  root 'home#show'
end
