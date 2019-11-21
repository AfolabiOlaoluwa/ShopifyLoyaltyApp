# frozen_string_literal: true

Sidekiq.configure_server do |config|
  config.redis = { url: ENV['PROD_REDIS_URL'], size: 9 } if Rails.env.production?
  config.redis = { url: ENV['REDIS_PROVIDER'] } if Rails.env.development?
end

Sidekiq.configure_client do |config|
  config.redis = { url: ENV['PROD_REDIS_URL'], size: 1 } if Rails.env.production?
  config.redis = { url: ENV['REDIS_PROVIDER'] } if Rails.env.development?
end