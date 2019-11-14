# frozen_string_literal: true

require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module ShopifyLoyaltyApp
  class Application < Rails::Application
    config.action_dispatch.default_headers['P3P'] = 'CP="Not used"'
    config.action_dispatch.default_headers.delete('X-Frame-Options')
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.0

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.

    config.to_prepare do
      Devise::SessionsController.layout 'embedded_app'
      Devise::RegistrationsController.layout 'embedded_app'
      Devise::ConfirmationsController.layout 'embedded_app'
      Devise::OmniauthCallbacksController.layout 'embedded_app'
      Devise::UnlocksController.layout 'embedded_app'
      Devise::PasswordsController.layout 'embedded_app'
    end

    config.exceptions_app = ->(env) { ExceptionsController.action(:show).call(env) }

    config.active_job.queue_adapter = :sidekiq
    # config.active_job.queue_adapter = Rails.env.production? ? :sidekiq : :async
  end
end
