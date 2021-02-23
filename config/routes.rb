Rails.application.routes.draw do
  # get 'trips/new'
  # get 'trips/create'
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :trips, only: %i[new create show] 
  resources :tickets, only: %i[index show]
end
