class UpdateNewArrivalJob < ApplicationJob
  queue_as :background

  def perform
    expired_products = Product.where(is_new_arrival: true).where('created_at < ?', 1.week.ago)

    UpdateExpiredProductsService.new(expired_products).call
  end
end
