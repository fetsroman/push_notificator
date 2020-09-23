Rails.application.routes.draw do
  namespace :admin do
    get '/sign_in', to: 'sessions#new'
    post '/sign_in', to: 'sessions#create'

    resources :users

    root to: "users#index"
  end

  namespace :api do
    post '/sign_up', to: 'users#create'
    post '/sign_in', to: 'authentication#sign_in'

    resources :devices, only: [:create]
    resources :notes, only: [:create]
  end
end
