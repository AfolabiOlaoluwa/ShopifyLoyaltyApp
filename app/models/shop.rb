class Shop < ActiveRecord::Base
  include ShopifyApp::SessionStorage

  has_many :customer_details
  has_many :earning_rules

  def api_version
    ShopifyApp.configuration.api_version
  end
end
