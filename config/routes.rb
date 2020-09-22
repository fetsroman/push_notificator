Rails.application.routes.draw do
  namespace :admin do
      resources :users

      root to: "users#index"
    end
  namespace :api do
    post '/sign_up', to: 'users#create'
    post '/sign_in', to: 'authentication#sign_in'
  end
end
