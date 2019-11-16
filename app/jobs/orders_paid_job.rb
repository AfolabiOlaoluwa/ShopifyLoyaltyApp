# frozen_string_literal: true

class OrdersPaidJob < ApplicationJob

  def perform(shop_domain:, webhook:)
    shop = Shop.find_by(shopify_domain: shop_domain)
    puts webhook.to_json

    puts webhook

    shop.with_shopify_session do
      # email = webhook[:email]
      # total_price = webhook[:total_price].to_f
      #
      # customers = webhook[:customer]
      # customers.each do |customer|
      #   first_name = customer.first_name
      #   last_name = customer.last_name
      # end
    end
  end

  # private

  # def api_response_call
  #   shop.with_shopify_session do
  #     result = ShopifyAPI::Order.find(:all, params: { limit: 2 }) # to_json, unarchived, paid, fulfilled
  #     result[0].email # => Name
  #     result[0].total_price # => Total Price
  #     result[0].name # => This gives id of customer I think
  #     customer_details = a[0].billing_address # => Nested record i.e. Customer Details
  #     customer_details.first_name # => First Name
  #     customer_details.last_name # => Last Name
  #
  #     # Put them in hash and insert all in the Database
  #   end
  # end
end
