FactoryBot.define do
  factory :customer_detail do
    user
    shop
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    email { Faker::Internet.email }
    amount_spent { Faker::Number.decimal(l_digits: 2) }
    point_balance { Faker::Number.decimal(l_digits: 2) }
    recorded_on { Faker::Date.between(from: 1.days.ago, to: Date.today) }
  end
end