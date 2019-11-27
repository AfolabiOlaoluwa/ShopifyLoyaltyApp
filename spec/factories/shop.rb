# frozen_string_literal: true

FactoryBot.define do
  factory :shop do
    shopify_domain { 'example.com' }
    shopify_token { '7af20c37352cce211639875b69fb6b94' }
  end
end