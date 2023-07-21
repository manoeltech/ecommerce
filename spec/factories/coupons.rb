FactoryBot.define do
  factory :coupon do
    code { "MyString" }
    status { 1 }
    discount_value { "9.99" }
    due_date { "2023-07-21 16:05:19" }
  end
end
