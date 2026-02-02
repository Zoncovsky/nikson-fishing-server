module Main
  class ProductsController < ApplicationController
    def show
          sleep 20
          @product = Product.find_by(id: 123)
        end
  end
end
