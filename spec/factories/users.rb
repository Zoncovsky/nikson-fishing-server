FactoryBot.define do
  factory :user do
    first_name { FFaker::Lorem.word }
    last_name { FFaker::Lorem.word }
    phone_number { FFaker::PhoneNumber.phone_number }
    email { FFaker::Internet.email }
    password { 'Password1' }
    password_confirmation { 'Password1' }
    confirmed_at { Time.now }
  end
end
