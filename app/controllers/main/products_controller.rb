def show
  @product = Product.find(123)  # <-- ERROR HERE
end
