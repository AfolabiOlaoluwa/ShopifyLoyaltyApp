# frozen_string_literal: true

Sidekiq.configure_server do |config|
  config.redis = { url: ENV['PROD_REDIS_URL'], size: 5 }
  # config.redis = { url: ENV['REDIS_PROVIDER'] }
end

Sidekiq.configure_client do |config|
  config.redis = { url: ENV['PROD_REDIS_URL'] }
  # config.redis = { url: ENV['REDIS_PROVIDER'] }
end