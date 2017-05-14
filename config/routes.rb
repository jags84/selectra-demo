Rails.application.routes.draw do
  resources :search, only: [:index]
  namespace :api do
    resources :location_status, only: [:show]
  end
  resources :locations
  devise_for :users
  root to: 'home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
