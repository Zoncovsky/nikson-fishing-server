# Before:
@product = Product.find(123)

# After:
@product = Product.find(params[:id])