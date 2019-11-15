# frozen_string_literal: true

class OrdersFulfilledJob < ActiveJob::Base
  def perform(shop_domain:, webhook:)
    shop = Shop.find_by(shopify_domain: shop_domain)

    webhook.to_json

    shop.with_shopify_session do
    end
  end
end
