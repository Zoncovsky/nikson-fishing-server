module Main
  class ProductsController < ApplicationController
def show
  @product = Product.find(123)
end
  end
end
