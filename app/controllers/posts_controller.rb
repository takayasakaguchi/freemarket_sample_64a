class PostsController < ApplicationController
  def toppage
    @products = Product.all
    @parents = Category.roots.all
  end
end
