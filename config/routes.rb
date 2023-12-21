Rails.application.routes.draw do
  get 'hello/world'
  get 'hello/worldGet', to: "hello#index" 
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get 'api/trial/:id', to: "trial#showTrialExecution"

  get 'experiments/', to: 'experiments#index'
  get 'api/experiments/', to: 'experiments#showAll'
  get 'api/experiments/:id', to: 'experiments#show'
  get 'api/experiments/:id/trial', to: 'experiments#listAllTrials'
 
  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
