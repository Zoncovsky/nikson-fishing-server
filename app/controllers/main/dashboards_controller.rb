module Main
  class DashboardsController < ApplicationController
    def index
      @popular_products = Product.popular
      @new_products = Product.new_arrivals
    end

    def catalog
      @main_categories = Category.all
      @search = Product.ransack(params[:q])

      if params[:category_id].present?
        Product.where(category_id: params[:category_id])
      else
        Product.all
      end

      @search_products = @search.result(distinct: true)
      @pagy, @products = pagy(@search_products.order(created_at: :asc), limit: 6)
    end

    def contact; end
    def cart; end
  end
end
