class PostsController < ApplicationController
  def toppage
    @products = Product.all
    # @image = image.new
    # @images = @products.images
    # @images = Image.all
  end
end
