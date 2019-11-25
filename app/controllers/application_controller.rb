# frozen_string_literal: true

class ApplicationController < ActionController::Base
  layout 'embedded_app'

  def current_shop
    @current_shop ||= Shop.find_by(shopify_domain: cookies[:shopify_domain])
  end
end
