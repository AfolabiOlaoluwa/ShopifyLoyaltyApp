# frozen_string_literal: true

Sidekiq.configure_server do |config|
  config.redis = Rails.env.production? ? { url: ENV['PROD_REDIS_URL'], size: 9 } : { url: ENV['DEV_REDIS_PROVIDER'] }
end

Sidekiq.configure_client do |config|
  config.redis = Rails.env.production? ? { url: ENV['PROD_REDIS_URL'], size: 1 } : { url: ENV['DEV_REDIS_PROVIDER'] }
end