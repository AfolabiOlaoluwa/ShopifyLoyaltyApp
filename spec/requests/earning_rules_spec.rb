# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'EarningRule', type: :request do
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

  describe '#create' do
    context '#when logged in' do
      before do
        @shop = create(:shop)
        @user = create(:user)
        sign_in @user
        login @shop
        @request.session[:shopify] = @shop.id
        @request.session[:shopify_domain] = @shop.shopify_domain
      end

      it 'renders new form' do
        get root_path
        get new_earning_rule_path
        expect(response).to render_template(:new)
      end

      it 'creates a earning rule' do
        post earning_rules_path, params: { earning_rule: { user: @user, shop: @shop, name: 'Order', point: 2, status: true }, format: :html }
        expect(response).to have_http_status(302)
      end

      it 'changes earning rules by 1' do
        expect do
          post earning_rules_path, params: { earning_rule: { user: @user, shop: @shop, name: 'Order', point: 2, status: true }, format: :html }
        end.to change(EarningRule, :count).by(1)
      end
    end

    context '#when not logged in' do
      it 'redirects to signin page' do
        get root_path
        get new_earning_rule_path
        expect(response.status).to eq 302
      end

      it 'returns unauthenticated' do
        post earning_rules_path, params: { earning_rule: { user: @user, shop: @shop, name: 'Order', point: 2, status: true }, format: :html }
        expect(response.status).to eq 302
      end

      it "doesn't create new entry" do
        expect do
          post earning_rules_path, params: { clock_entry: { user: @user, shop: @shop, name: 'Order', point: 2, status: true }, format: :html }
        end.not_to change(EarningRule, :count)
      end
    end
  end
end