module Main
  class DashboardsController < ApplicationController
    def index
      @popular_products = Product.popular
      @new_products = Product.new_arrivals
    end

    def catalog
      @main_categories = Category.all

      if params[:category_id].present?
        @products = Product.where(category_id: params[:category_id])
      else
        @products = Product.all.order(created_at: :desc)
      end
    end

    def contact; end

    def cart; end
  end
end
