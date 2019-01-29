Rails.application.routes.draw do
  mount Blazer::Engine, at: "blazer"
  require 'sidekiq/web'
  mount Sidekiq::Web, at: "/sidekiq"

  get 'docs' => redirect('/swagger-ui/dist/index.html');

  namespace :api do
    namespace :v1 do
      get 'api-docs', to: 'docs#index'
      post 'users', to: 'users#create'
      post 'sessions', to: 'sessions#create'
      post 'sessions/destroy', to: 'sessions#destroy'
      post 'notification/send_sns', to: 'notification#send_sns'

      get 'courses', to: 'courses#index'
      get 'courses/:id', to: 'courses#show'
    end
  end
end
