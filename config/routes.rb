Rails.application.routes.draw do
  devise_for :users

  get "/users/:username", to: "users#show", as: "user_profile"
  get "/users/:username/feed", to: "users#feed", as: "user_feed"
  get "/users/:username/liked_photos", to: "users#liked_photos", as: "user_liked_photos"
  get "/users/:username/discover", to: "users#discover", as: "user_discover"

  root "home#index"
end
