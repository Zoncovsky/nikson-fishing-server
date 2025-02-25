class UpdateExpiredProductsService
  def initialize(expired_products)
    @expired_products = expired_products
  end

  def call
    update_is_new_arrival_status
  end

  def update_is_new_arrival_status
    @expired_products.each do |expired_product|
      expired_product.update(is_new_arrival: false)
    end
  end
end
