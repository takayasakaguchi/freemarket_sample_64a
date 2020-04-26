class GetCategoryGrandchildrenController < ApplicationController
  def index
    #選択された子カテゴリーに紐付く孫カraigテゴリーの配列を取得
    @category_grandchildren = Category.find(params[:child_id]).children
  end
end
