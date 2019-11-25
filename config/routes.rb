# frozen_string_literal: true

Rails.application.routes.draw do
  require 'sidekiq/web'

  mount Sidekiq::Web => '/sidekiq'

  mount ShopifyApp::Engine, at: '/'

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    unlock: 'users/unlock',
    passwords: 'users/passwords',
    confirmations: 'users/confirmations'
  }

  get 'customer_details/index'

  resources :earning_rules

  root to: 'earning_rules#index'

  get 'exceptions/show'

  controller :mandatory_webhooks do
    post '/webhooks/shop_redact' => :shop_redact
    post '/webhooks/customers_redact' => :customer_redact
    post '/webhooks/customers_data_request' => :customers_data_request
  end

  resources :webhooks, only: [] do
    collection do
      post :orders_paid
    end
  end
end
