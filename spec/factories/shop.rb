FactoryBot.define do
  factory :shop do
    shopify_domain { Faker::Internet.domain_name(subdomain: true, domain: "example") }
    shopify_token { '7af20c37352cce211639875b69fb6b94' }
  end
end