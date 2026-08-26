FactoryBot.define do
  factory :order do
    customer_email { FFaker::Internet.email }
    total { rand(100..10_000) }
    address { FFaker::Address.street_address }
    city { FFaker::Address.city }
    post_number { FFaker::Address.post_code }
    status { :pending }
    user
  end
end
