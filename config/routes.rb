# frozen_string_literal: true

Rails.application.routes.draw do
  resources :customer_details
  resources :earning_rules
  root to: 'home#index'

  mount ShopifyApp::Engine, at: '/'

  get 'exceptions/show'
end
