Rails.application.routes.draw do
  resources :user_relations
  resources :users, only: [:create]


  post "/signup", to: "users#create"
  post "/login", to: "users#login"


  post "/follow", to: "user_relations#follow"

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
