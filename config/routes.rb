Rails.application.routes.draw do
  get 'restricted', to: 'restricted#index'
  devise_for :users
  get "up" => "rails/health#show", as: :rails_health_check
  get "/", to: "home#index"

  # Defines the root path route ("/")
  # root "posts#index"

  get'home', to: "home#index"
end
