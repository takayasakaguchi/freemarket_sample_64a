class CategoriesController < ApplicationController
  def show
    @parents = Category.roots.all
    @category = Category.find(params[:id])

    array = @category.descendant_ids
    array.push(@category.id)
    
    @products = Product.where(category_id: array)
  end
end
