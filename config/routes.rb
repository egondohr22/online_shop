Rails.application.routes.draw do
  root 'home#new'
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get 'users', to: 'users#index', as: "users"
  get 'signup', to: 'users#new'
  get 'goodbye', to: 'application#goodbye'
  get 'extra', to: 'application#extra'
  get 'tema', to: 'application#tema'
  get 'logout', to: 'extra#new'
  # Defines the root path route ("/")
  # root "articles#index"
end
