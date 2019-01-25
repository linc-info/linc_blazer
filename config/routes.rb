Rails.application.routes.draw do
  mount Blazer::Engine, at: "blazer"
  require 'sidekiq/web'
  mount Sidekiq::Web, at: "/sidekiq"

  namespace :api do
    namespace :v1 do
      post 'users', to: 'sign#sign_up'
      post 'users/sign_in', to: 'sign#sign_in'
      post 'users/sign_out', to: 'sign#sign_out'
    end
  end
end
