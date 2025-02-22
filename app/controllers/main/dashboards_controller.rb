module Main
  class DashboardsController < ApplicationController
    before_action :load_categories, only: :catalog
    before_action :load_products, only: :catalog

    def index
      @popular_products = Product.popular
    end

    def catalog
      @pagy, @products = pagy(@search_products, limit: 6)
    end

    def contact; end
    def cart; end

    private

    def load_categories
      @main_categories = Category.pluck(:id, :name)
    end

    def load_products
      @search = Product.ransack(search_params[:q])
      @search_products = Product.where(category_filter).merge(@search.result(distinct: true))
      @search_products = @search_products.order(sorting_order)
    end

    def search_params
      params.permit(:sort, q: {})
    end

    def category_filter
      params[:category_id].present? ? { category_id: params[:category_id] } : {}
    end

    def sorting_order
      search_params[:sort].presence || 'created_at DESC'
    end
  end
end
