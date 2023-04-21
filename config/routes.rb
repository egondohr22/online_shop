Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root 'application#hello'
  get 'goodbye', to: 'application#goodbye'
  get 'extra', to: 'application#extra'
  get 'tema', to: 'application#tema'
  # Defines the root path route ("/")
  # root "articles#index"
end
