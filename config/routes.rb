Rails.application.routes.draw do
  resources :carts
  resources :shipping_addresses
  resources :billing_addresses
  resources :orders
  resources :categories
  resources :products
  devise_for :users

  resources :users
  root 'home#new'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # get 'users', to: 'users#index', as: "users"
  # get 'users/:id', to: 'users#show', as: "profile"
  get 'signup', to: 'users#new'
  get 'goodbye', to: 'application#goodbye'
  get 'extra', to: 'application#extra'
  get 'tema', to: 'application#tema'
  get 'logout', to: 'extra#new'
  # Defines the root path route ("/")
  # root "articles#index"
end
