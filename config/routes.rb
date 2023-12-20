Rails.application.routes.draw do
  get 'hello/world'
  get 'hello/worldGet', to: "hello#index" 
  get 'graph/skills'
  get 'graph/skillsGet', to: "graph#jsonGet"
  get 'velocity/graph/:id', to: "velocity#graph"
  get 'velocity/getData/:id', to: "velocity#getData"

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
