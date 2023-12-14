Rails.application.routes.draw do
  get 'simulators/index'
  get 'simulators/new', to: 'simulators#new', as: 'new_simulator'
  get 'simulators/:id', to:'simulators#show'
  get 'hello/world'
  resources :simulators do
    member do
      get 'toggle', to: 'simulators#toggle'
      get 'delete', to: 'simulators#delete'
    end
  end

  post 'simulators', to: 'simulators#create'

  root to:"simulators#index"
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
