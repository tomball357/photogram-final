Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "home#index"

  get "/users/:username/feed", to: "users#feed", as: "user_feed"

  resources :follow_requests, only: [:create, :destroy]


end
