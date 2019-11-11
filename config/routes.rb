# frozen_string_literal: true

Rails.application.routes.draw do
  resources :customer_details

  namespace :admin do
    namespace :app do
      resources :earning_rules, path: '/fera-loyalty'
    end
  end

  root to: 'home#index'

  mount ShopifyApp::Engine, at: '/'

  get 'exceptions/show'
end
