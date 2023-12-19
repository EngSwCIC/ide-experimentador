Rails.application.routes.draw do
  # Defines the root path route ("/")
  # root "posts#index"
  root "experimentos#index"
  # config/routes.rb
  post '/tests/start_tests', to: 'tests#start_tests'
  get '/tests/check_status/:id', to: 'tests#check_status'
  delete '/tests/stop_test/:id', to: 'tests#stop_test'
end
