FactoryBot.define do
  factory :order do
    customer_email { "MyString" }
    total { 1 }
    address { "MyString" }
  end
end
