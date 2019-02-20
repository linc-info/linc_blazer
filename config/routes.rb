Rails.application.routes.draw do
  mount Blazer::Engine, at: "blazer"
  require 'sidekiq/web'
  mount Sidekiq::Web, at: "/sidekiq"

  get 'lp', to: 'lp#index'
end
