# frozen_string_literal: true

Rails.application.routes.draw do
  require 'sidekiq/web'

  mount Sidekiq::Web => '/sidekiq'

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    unlock: 'users/unlock',
    passwords: 'users/passwords',
    confirmations: 'users/confirmations'
  }

  resources :customer_details
  resources :earning_rules

  # root to: 'earning_rules#index'
  root to: 'home#index'
  # get '/home', to: 'home#index'

  mount ShopifyApp::Engine, at: '/'

  get 'exceptions/show'

  controller :mandatory_webhooks do
    post '/webhooks/shop_redact' => :shop_redact
    post '/webhooks/customers_redact' => :customer_redact
    post '/webhooks/customers_data_request' => :customers_data_request
  end

  post '/webhooks/orders_fulfilled', to: 'order_webhooks#orders_fulfilled'
  post '/webhooks/orders_paid', to: 'order_webhooks#orders_paid'
end
