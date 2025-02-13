class Order < ApplicationRecord
  belongs_to :user
  has_many :order_products, dependent: :destroy
  has_many :products, through: :order_products

  def self.ransackable_associations(auth_object = nil)
    ["order_products", "products", "user"]
  end

  def self.ransackable_attributes(auth_object = nil)
    ["address", "created_at", "customer_email", "id", "id_value", "total", "updated_at", "user_id"]
  end
end
