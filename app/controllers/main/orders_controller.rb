module Main
  class OrdersController < ApplicationController
    before_action :authenticate_user!
    before_action :set_order, only: %i[show]

    def index
      @orders = Order.all
    end

    def show; end

    def create
      @order = Order.new(order_params)

      respond_to do |format|
        if @order.save
          format.html { redirect_to root_path, notice: t('order.created') }
          format.json { render :show, status: :created, location: @order }
        else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @order.errors, status: :unprocessable_entity }
        end
      end
    end

    private

    def set_order
      @order = Order.find(params[:id])
    end

    def order_params
      params.require(:order).permit(:customer_email, :total, :address, products: [])
    end
  end
end
