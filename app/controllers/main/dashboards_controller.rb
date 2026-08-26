module Main
  class DashboardsController < ApplicationController
    before_action :load_categories, only: :catalog
    before_action :load_products, only: :catalog
    before_action :authenticate_user!, only: :cart

    def index
      @popular_products = Product.popular
      @new_arrivals = Product.new_arrivals
      @revenue = calculate_daily_revenue
      @top_products = Product.best_sellers.to_a
    end

    def catalog
      @products = @search_products
    end

    def contact
    end
    def cart
    end

    private

    def calculate_daily_revenue
      today = Time.now.beginning_of_day...Time.now.end_of_day

      orders = Order.done
                    .where(created_at: today)
                    .joins(:products)

      total = orders.sum(:total)
      count = orders.count

      { total: total, average: count.zero? ? 0 : total / count, count: count }
    end

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

    ALLOWED_SORT_COLUMNS = %w[created_at price name].freeze
    ALLOWED_SORT_DIRECTIONS = %w[ASC DESC].freeze

    def sorting_order
      return 'created_at DESC' unless search_params[:sort].present?

      column, direction = search_params[:sort].split
      column = ALLOWED_SORT_COLUMNS.include?(column) ? column : 'created_at'
      direction = ALLOWED_SORT_DIRECTIONS.include?(direction&.upcase) ? direction.upcase : 'DESC'

      "#{column} #{direction}"
    end
  end
end
