Rails.application.routes.draw do
  resources :user_activities
  resources :episodes
  resources :user_subscriptions
  resources :podcasts
  resources :user_relations
  resources :users, only: [:create]

  # Auth routes
  post "/login", to: "auth#login"
  get "/auto_login", to: "auth#auto_login"
  get "/user_is_authed", to: "auth#user_is_authed"

  # Podcast routes
  get "/my-podcasts/:id", to: "podcasts#my_podcasts"
  get "/random", to: "podcasts#random"

  # Activity routes
  get "/my-activity/:id", to: "user_activities#my_activities"
  post "/listened", to: "user_activities#listened"
  post "/subscribe", to: "user_subscriptions#create"
  post "/rating", to: "user_activities#rating" #change this name
  get "/podcast-rating", to: "user_activities#podcast_rating"
  get "friend-activity/:id", to: "user_activities#friend_activity"

  # Profile routes
  get "/user-search/:id", to: "user_relations#return_user"

  # routes to create a new UserRelation and to return existing relations for a user
  post "/follow", to: "user_relations#follow"
  get "/following/:id", to: "user_relations#existing_relations_following"
  get "/followers/:id", to: "user_relations#existing_relations_followers"





  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "welcome#index"
end
