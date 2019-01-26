Rails.application.routes.draw do
  mount Blazer::Engine, at: "blazer"
  require 'sidekiq/web'
  mount Sidekiq::Web, at: "/sidekiq"

  namespace :api do
    namespace :v1 do
      post 'users', to: 'users#create'

      post 'sessions', to: 'sessions#create'
      post 'sessions/destroy', to: 'sessions#destroy'

      post 'notification/send_sns', to: 'notification#send_sns'
    end
  end
end
