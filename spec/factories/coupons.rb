FactoryBot.define do
  factory :coupon do
    code { Faker::Commerce.promotion_code(digits: 6)}
    status { %i(active inactive).sample }
    discount_value { rand(1..99) }
    due_date { "2023-07-21 16:05:19" }
  end
end
