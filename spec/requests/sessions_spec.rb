# frozen_string_literal: true

require 'rails_helper'
RSpec.describe 'Sessions' do
  def login(shop)
    OmniAuth.config.test_mode = true
    OmniAuth.config.add_mock(:shopify,
                             provider: 'shopify',
                             uid: shop.shopify_domain,
                             credentials: { token: shop.shopify_token })
    Rails.application.env_config['omniauth.auth'] = OmniAuth.config.mock_auth['shopify']

    get '/auth/shopify'
    follow_redirect!
  end

  it 'signs user in and out' do
    @shop = create(:shop)
    user = create(:user)
    login @shop
    @request.session[:shopify] = @shop.id
    @request.session[:shopify_domain] = @shop.shopify_domain

    sign_in user
    get root_path
    expect(response).to redirect_to('/earning_rules/new')

    sign_out user
    get root_path
    expect(response).not_to render_template(:index)
  end
end