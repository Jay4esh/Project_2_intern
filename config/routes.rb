Rails.application.routes.draw do
  get 'expenses/new'
  get 'expenses/create'
  get 'expenses/edit'
  get 'expenses/update'
  get 'expenses/destroy'
  resources :businesspartners
  devise_for :users, :path => 'u'
  resources :users
  resources :expenses do
    collection do
      post ':type', action: :create, as: :create_type
      get 'new/:type', action: :new, as: :new_type
    end
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  root "users#home"

  # Defines the root path route ("/")
  # root "posts#index"
end
