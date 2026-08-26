FactoryBot.define do
  factory :order_product do
    product
    order
    quantity { rand(1..10) }
  end
end
