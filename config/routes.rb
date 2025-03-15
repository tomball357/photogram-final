Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  

  get "/", to: "home#index"

  get "/users/:username", to: "users#show", as: "user_profile"


  resources :follow_requests, only: [:create, :destroy]
  resources :users, only: [:index, :show]
  resources :photos, only: [:index, :create, :show, :destroy, :update]



end
