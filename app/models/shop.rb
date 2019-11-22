class Shop < ActiveRecord::Base
  include ShopifyApp::SessionStorage

  has_many :earning_rules
  has_many :customer_details

  def api_version
    ShopifyApp.configuration.api_version
  end
end
