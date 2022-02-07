Rails.application.routes.draw do
  resources :user_activities
  resources :episodes
  resources :user_subscriptions
  resources :podcasts
  resources :user_relations
  resources :users, only: [:create]

  # Auth routes
  post "/signup", to: "users#create"
  post "/login", to: "users#login"
  get "/auto_login", to: "users#auto_login"

  get "/my-podcasts/:id", to: "podcasts#my_podcasts"
  get "/random", to: "podcasts#random"

  # Activity routes
  get "/my-activity/:id", to: "user_activities#my_activities"
  post "/listened", to: "user_activities#listened"
  post "/subscribe", to: "user_subscriptions#create"
  post "/rating", to: "user_activities#rating"
  get "/podcast-rating", to: "user_activities#podcast_rating"

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
