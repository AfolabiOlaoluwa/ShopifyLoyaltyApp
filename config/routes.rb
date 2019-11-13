# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    unlock: 'users/unlock',
    passwords: 'users/passwords',
    confirmations: 'users/confirmations'
    # omniauth_callbacks: 'users/omniauth_callbacks'
  }

  resources :customer_details
  resources :earning_rules

  root to: 'earning_rules#index'

  mount ShopifyApp::Engine, at: '/'

  get 'exceptions/show'
end
