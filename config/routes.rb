Rails.application.routes.draw do
  resources :user_activities
  resources :episodes
  resources :user_subscriptions
  resources :podcasts
  resources :user_relations
  resources :users, only: [:create]


  post "/signup", to: "users#create"
  post "/login", to: "users#login"


  post "/follow", to: "user_relations#follow"

  post "/subscribe", to: "user_subscriptions#create"

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
