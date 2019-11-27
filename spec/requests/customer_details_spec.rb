# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'CustomerDetail', type: :request do
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

  describe '#index' do
    context 'when logged in' do
      before { cookies[:shopify_domain] = 'example.com' }

      before do
        @shop = create(:shop)
        @user = create(:user)
        sign_in @user
        login @shop
        @request.session[:shopify] = @shop.id
        @request.session[:shopify_domain] = @shop.shopify_domain
      end

      it 'should returns a 200 response' do
        get customer_details_index_path
        expect(response).to have_http_status '200'
      end

      it 'should render customer details index page' do
        get customer_details_index_path
        expect(response).to render_template(:index)
      end
    end

    context 'when not logged in' do
      it 'redirects to signin page' do
        get root_path
        get customer_details_index_path
        expect(response.status).to eq 302
      end
    end
  end
end