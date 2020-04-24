class ProductsController < ApplicationController
  def show
    @product = Product.find(params[:id])
    @images = @product.images
  end

  def new
    
  end

  def destroy
    product = Product.find(params[:id])
    product.destroy
    redirect_to root_path
  end
end
