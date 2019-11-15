# frozen_string_literal: true

class OrderWebhooksController < ApplicationController
  include ShopifyApp::WebhookVerification

  def orders_fulfilled
    params.permit!
    OrdersFulfilledJob.perform_later(shop_domain: shop_domain, webhook: webhook_params.to_h)
    head :no_content
  end

  def orders_paid
    params.permit!
    OrdersPaidJob.perform_later(shop_domain: shop_domain, webhook: webhook_params.to_h)
    head :no_content
  end

  private

  def webhook_params
    params.except(:controller, :action, :type)
  end
end
