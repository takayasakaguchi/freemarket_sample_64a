class PostsController < ApplicationController
  def toppage
    @products = Product.all
  end
end
