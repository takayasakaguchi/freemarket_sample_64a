class ProductsController < ApplicationController
  before_action :set_product,only: [:destroy, :show]

  def show
    @product = Product.find(params[:id])
    @images = @product.images
  end

  def new
    
  end

  def destroy
    product.destroy
  end

  def set_product
    product = Product.find(params[:id])

    if product.destroy 
    redirect_to root_path

    else
      render_from StandardError, with: :render_500 unless Rails.env.development?
    end
  end
end
