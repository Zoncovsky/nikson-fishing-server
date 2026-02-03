class CreateOrderMailer < ApplicationMailer
  def new_order(user, order)
    @user_name = user.full_name
    @user_phone = user.phone_number

    @email = order.customer_email
    @total_price = order.total
    @address = order.address
    @city = order.city
    @post_number = order.post_number
    @comment = order.comment
    @products = order.products
    @order_products = order.order_products

    @order_products_with_quantity = @products.map do |product|
      order_product = @order_products.each { |op| op.product_id == product.id }
      {
        product: product,
        quantity: order_product ? order_product.quantity : 0
      }
    end

    mail(to: Rails.application.credentials.owner_email, cc: @email, subject: t('.subject'))
  end
end
