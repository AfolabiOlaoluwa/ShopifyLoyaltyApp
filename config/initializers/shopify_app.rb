ShopifyApp.configure do |config|
  config.application_name = "Fera Loyalty Program"
  config.api_key = ENV['SHOPIFY_API_KEY']
  config.secret = ENV['SHOPIFY_API_SECRET']
  config.old_secret = ""
  config.scope = "read_orders, write_orders, read_products" # read_all_orders
  config.embedded_app = true
  config.after_authenticate_job = false
  config.api_version = "2019-10"
  config.session_repository = ShopifyApp::InMemorySessionStore
end