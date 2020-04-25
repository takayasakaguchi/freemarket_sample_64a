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
  rescue => e
    rescue_from StandardError, with: :render_500 unless Rails.env.development?
  end
end
