Rails.application.routes.draw do
  devise_for :users
  resources :rooms, only: %i[create edit update destroy]
  resources :messages, only: %i[create]

  root 'home#index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
