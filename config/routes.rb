Rails.application.routes.draw do
  devise_for :users
  # Prioritize the specific routes before the general :username route
  get "/users/:username/feed", to: "users#feed", as: "user_feed"
  get "/users/:username/liked_photos", to: "users#liked_photos", as: "user_liked_photos"
  get "/users/:username/discover", to: "users#discover", as: "user_discover"

  # Ensure this is defined after the more specific routes to prevent conflicts
  get "/users/:username", to: "users#show", as: "user_profile"

  # Root Path
  root "home#index"

  # Other system-defined routes (do not modify)
  mount RailsDb::Engine => "/rails/db", as: "rails_db"

  # Turbo Native Navigation Routes
  get "/recede_historical_location", to: "turbo/native/navigation#recede"
  get "/resume_historical_location", to: "turbo/native/navigation#resume"
  get "/refresh_historical_location", to: "turbo/native/navigation#refresh"

  # Mailbox routes (should not be changed)
  post "/rails/action_mailbox/postmark/inbound_emails", to: "action_mailbox/ingresses/postmark/inbound_emails#create"
  post "/rails/action_mailbox/relay/inbound_emails", to: "action_mailbox/ingresses/relay/inbound_emails#create"
  post "/rails/action_mailbox/sendgrid/inbound_emails", to: "action_mailbox/ingresses/sendgrid/inbound_emails#create"
  get "/rails/action_mailbox/mandrill/inbound_emails", to: "action_mailbox/ingresses/mandrill/inbound_emails#health_check"
  post "/rails/action_mailbox/mandrill/inbound_emails", to: "action_mailbox/ingresses/mandrill/inbound_emails#create"
  post "/rails/action_mailbox/mailgun/inbound_emails/mime", to: "action_mailbox/ingresses/mailgun/inbound_emails#create"

  # Active Storage Routes
  get "/rails/active_storage/blobs/redirect/:signed_id/*filename", to: "active_storage/blobs/redirect#show", as: "rails_service_blob"
  get "/rails/active_storage/blobs/proxy/:signed_id/*filename", to: "active_storage/blobs/proxy#show", as: "rails_service_blob_proxy"
  get "/rails/active_storage/representations/redirect/:signed_blob_id/:variation_key/*filename", to: "active_storage/representations/redirect#show", as: "rails_blob_representation"
  get "/rails/active_storage/representations/proxy/:signed_blob_id/:variation_key/*filename", to: "active_storage/representations/proxy#show", as: "rails_blob_representation_proxy"
  get "/rails/active_storage/disk/:encoded_key/*filename", to: "active_storage/disk#show", as: "rails_disk_service"
  put "/rails/active_storage/disk/:encoded_token", to: "active_storage/disk#update", as: "update_rails_disk_service"
  post "/rails/active_storage/direct_uploads", to: "active_storage/direct_uploads#create", as: "rails_direct_uploads"

  # Rails Database Debugging Tools
  get "/erd", to: "dev_toolbar/erd#show", as: "erd"

  # RailsDb engine routes (used for DB management)
  mount RailsDb::Engine => "/rails/db"
end
