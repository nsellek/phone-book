Rails.application.routes.draw do
  root 'users#index'
  resources :users
  resources :states, except: %i[ index ]
end
