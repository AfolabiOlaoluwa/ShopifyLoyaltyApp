Rails.application.config.middleware.use OmniAuth::Builder do
  # frozen_string_literal: true

  provider :shopify,
           ShopifyApp.configuration.api_key,
           ShopifyApp.configuration.secret,
           scope: ShopifyApp.configuration.scope,
           callback_path: '/auth/shopify/callback'
end
