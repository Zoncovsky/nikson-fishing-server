FactoryBot.define do
  factory :user do
    first_name { FFaker::Lorem.word }
    last_name { FFaker::Lorem.word }
    phone_number { FFaker::PhoneNumber.phone_number }
  end
end
