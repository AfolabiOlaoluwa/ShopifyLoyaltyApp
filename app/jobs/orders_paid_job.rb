# frozen_string_literal: true

class OrdersPaidJob < ApplicationJob
  def perform(shop_domain:, webhook:)
    shop = Shop.find_by(shopify_domain: shop_domain)
    return unless shop

    shop.with_shopify_session do
      customer = webhook['customer']

      payload = {
        shop_id: shop.id,
        email: customer['email'],
        amount_spent: customer['total_spent'],
        first_name: customer['first_name'],
        last_name: customer['last_name'],
        previous_point: previous_points(customer, shop.id, webhook),
        point_balance: awarded_points(customer, shop.id),
        recorded_on: Time.now
      }

      CustomerDetail.upsert(payload, unique_by: :email)
      OrderPointsJob.perform_now(customer['email'])
    end
  end

  private

  def awarded_points(customer, shop)
    return 1 unless EarningRule.order_rule(shop)

    (customer['total_spent']).to_i * EarningRule.order_rule(shop)
  end

  def previous_points(customer, shop, webhook)
    (customer['total_spent'].to_i - webhook['total_price'].to_i) * EarningRule.order_rule(shop)
  end
end