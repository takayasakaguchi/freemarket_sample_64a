class CategoriesController < ApplicationController
  def show
    @parents = Category.roots.all
    @parent = Category.roots.all
    @category = Category.find(params[:id])
    @products = @category.products
  end
end
