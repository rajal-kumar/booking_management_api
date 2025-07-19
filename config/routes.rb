Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :cars, only: [:index]
      resources :services, only: [:index]
      resources :bookings, only: [:index, :create]
    end
  end
  get 'current_user', to: 'current_user#index'
  devise_for :users, path: '', path_names: {
    sign_in: 'login',
    sign_out: 'logout',
    registration: 'signup'
  },
  controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
