# frozen_string_literal: true

ShopifyApp.configure do |config|
  config.application_name = 'Fera Loyalty'
  config.api_key = ENV['SHOPIFY_API_KEY']
  config.secret = ENV['SHOPIFY_API_SECRET']
  config.old_secret = ''
  config.scope = 'read_orders, write_orders, read_products'
  config.embedded_app = true
  config.after_authenticate_job = false
  config.api_version = '2019-10'
  config.session_repository = Shop
  config.webhooks = [
    {
      topic: 'orders/fulfilled',
      address: 'https://6338c39e.ngrok.io/webhooks/orders_fulfilled',
      format: 'json'
    },
    {
      topic: 'orders/paid',
      address: 'https://6338c39e.ngrok.io/webhooks/orders_paid',
      format: 'json'
    }
  ]
end