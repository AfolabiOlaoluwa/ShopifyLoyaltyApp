# frozen_string_literal: true

class MandatoryWebhooksController < ApplicationController
  include ShopifyApp::WebhookVerification

  def shop_redact
    params.permit!
    ShopRedactJob.perform_later(shop_domain: shop_domain, webhook: webhook_params.to_h)
    head :no_content
  end

  def customers_redact
    params.permit!
    CustomersRedactJob.perform_later(shop_domain: shop_domain, webhook: webhook_params.to_h)
    head :no_content
  end

  def customers_data_request
    params.permit!
    CustomersDataRequestJob.perform_later(shop_domain: shop_domain, webhook: webhook_params.to_h)
    head :no_content
  end

  private

  def webhook_params
    params.except(:controller, :action, :type)
  end
end
