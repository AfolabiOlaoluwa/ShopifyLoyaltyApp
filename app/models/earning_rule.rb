# frozen_string_literal: true

class EarningRule < ApplicationRecord

  belongs_to :user
  belongs_to :shop

  validates :name, presence: true
  validates :point, presence: true

  scope :order_rule, ->(shop) { where(shop: shop).where(status: 'true').where(name: 'Order').pick(:point) }

  def set_shop
    self.shop = current_shop
  end

  private

  def current_shop
    shop ||= ShopifyAPI::Shop.current.domain
    Shop.find_by(shopify_domain: shop)
  end
end