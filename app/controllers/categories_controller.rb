class CategoriesController < ApplicationController
  def index
    @parents = Category.roots.all
  end

  def show
    @parents = Category.roots.all
    @category = Category.find(params[:id])

    # @categoryの子供以下のカテゴリのid全てと、@categoryのidが入った配列を作成
    array = @category.descendant_ids
    array.push(@category.id)
    
    @products = Product.where(category_id: array)
  end
end
