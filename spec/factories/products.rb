FactoryBot.define do
  factory :product do
    name { FFaker::Lorem.word }
    description { FFaker::Lorem.sentence }
    price { rand(1..100) }
    is_popular { [true, false].sample }
    is_new_arrival { [true, false].sample }
    category
  end
end
