module Main
  class ProductsController < ApplicationController
    def show
      @product = Product.find(123)
    @product = Product.find(params[:id])
  end
end
