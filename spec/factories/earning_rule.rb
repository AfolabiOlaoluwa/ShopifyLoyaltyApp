# frozen_string_literal: true

FactoryBot.define do
  factory :earning_rule do
    user
    shop
    name { Faker::Lorem.sentence }
    point { Faker::Number.digit }
    status { Faker::Boolean.boolean }
  end
end