class ProductsController < ApplicationController
  def show
    @product = Product.includes(:user).find(1)
    @images = @product.images
    # @parents = Category.all
    # @users = User.includes(:user)
  end

  def new
    
  end
end
