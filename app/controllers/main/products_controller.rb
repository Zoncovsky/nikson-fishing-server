module Main
  class ProductsController < ApplicationController
    def show
      @product = Product.find_by(id: 123)
    end
  end
end
