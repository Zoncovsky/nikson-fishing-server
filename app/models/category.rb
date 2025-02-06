class Category < ApplicationRecord
  has_many :products, dependent: :destroy

  has_one_attached :logo do |attachable|
    attachable.variant :thumb, resize_to_limit: [ 50, 50 ]
  end

  scope :root_categories, -> { where(parent_id: nil) }

  def self.ransackable_attributes(auth_object = nil)
    %w[ created_at id name record_id record_type ]
  end

  def self.ransackable_associations(auth_object = nil)
    %w[ products ]
  end
end
