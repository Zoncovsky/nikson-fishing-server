class Product < ApplicationRecord
  belongs_to :category, optional: true
  has_many :order_products, dependent: :destroy
  has_many :orders, through: :order_products

  has_many_attached :images do |attachable|
    attachable.variant :thumb, resize_to_limit: [50, 50]
    attachable.variant :medium, resize_to_limit: [250, 250]
  end

  scope :popular, -> { where(is_popular: true) }
  scope :new_arrivals, -> { where(is_new_arrival: true) }


  def self.ransackable_attributes(auth_object = nil)
    ["category_id", "created_at", "description", "id", "is_new_arrival", "is_popular", "name", "price", "updated_at"]
  end

  def self.ransackable_associations(auth_object = nil)
    %w[category]
  end
end
