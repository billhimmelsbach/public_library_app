Rails.application.routes.draw do
  root to: "users#index"
  get "/users", to: "users#index", as: "users"
  get "/users/new", to: "users#new", as: "new_user"
  post "/users", to: "users#create"
  get "/users/:id", to: "users#show", as: "user"
  get "/login", to: "sessions#new"
  get "/logout", to: "sessions#destroy"
  get "/users/secret", to: "users#show", as: "secret"
  post "/sessions", to: "sessions#create"
  get "/libraries", to: "libraries#index", as: "libraries"
  get "/libraries/new", to: "libraries#new", as: "new_library"
  post "/libraries", to: "libraries#create"
  get "/libraries/:id", to: "libraries#show", as: "library"

end
