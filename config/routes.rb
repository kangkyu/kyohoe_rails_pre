Rails.application.routes.draw do
  use_doorkeeper_openid_connect
  use_doorkeeper

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  resource :user_session, only: [:new, :create, :destroy]
  get "sign_in", to: "user_sessions#new"

  namespace :api do
    namespace :v1 do
      resources :postings, only: [:show]
    end
  end

  # Defines the root path route ("/")
  # root "posts#index"
  root "tokens#show"
end
