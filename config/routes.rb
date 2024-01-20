Rails.application.routes.draw do
  resources :businesspartners
  devise_for :users, :path => 'u'
  resources :users
  get '/custom_users/new_user', to: 'custom_users#new_user', as: 'new_custom_user'
  post '/custom_users/create_user', to: 'custom_users#create_user', as: 'create_custom_user'


  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  root "users#home"

  # Defines the root path route ("/")
  # root "posts#index"
end
