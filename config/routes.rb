Rails.application.routes.draw do
  resources :user_activities
  resources :episodes
  resources :user_subscriptions
  resources :podcasts
  resources :user_relations
  resources :users, only: [:create]


  post "/signup", to: "users#create"
  post "/login", to: "users#login"
  get "/auto_login", to: "users#auto_login"

  get "/my-podcasts/:id", to: "podcasts#my_podcasts"
  get "/my-activity/:id", to: "user_activities#my_activities"

  post "/listened", to: "user_activities#listened"

  get "/user-search/:id", to: "user_relations#return_user"

  # routes to create a new UserRelation and to return existing relations for a user
  post "/follow", to: "user_relations#follow"
  get "/following/:id", to: "user_relations#existing_relations_following"

  get "/followers/:id", to: "user_relations#existing_relations_followers"

  post "/subscribe", to: "user_subscriptions#create"

  get "/random", to: "podcasts#random"

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "/"
end
