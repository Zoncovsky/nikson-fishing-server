module Main
  class OrdersController < ApplicationController
    before_action :authenticate_user!
    before_action :set_order, only: %i[show]

    def index
      @orders = current_user.orders
    end

    def show; end

    def new
      @order = Order.new
    end

    def create
      @order = current_user.orders.create!(order_params)

      if params[:phone_number].present? && current_user.phone_number.blank?
        current_user.update(phone_number: params[:phone_number])
      end

      if @order.save
        CreateOrderMailer.new_order(current_user, @order).deliver_later

        flash[:notice] = t('order.created')

        redirect_to root_path, flash: { notice: t('order.created') }
      else
        redirect_to cart_path, flash: { alert: @order.errors.full_messages.join(', ') }
      end
    end

    private

    def set_order
      @order = Order.find(params[:id])
    end

    def order_params
      params.require(:order).permit(
        :customer_email,
        :total,
        :address,
        :city,
        :post_number,
        :comment,
        :status,
        order_products_attributes: [:product_id, :quantity]
      )
    end
  end
end
