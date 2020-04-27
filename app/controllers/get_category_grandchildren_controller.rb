class GetCategoryGrandchildrenController < ApplicationController
  # 商品出品ページでvalidationにかかった時用のアクション
  # 商品出品ページで子カテゴリーが選択された後に動くアクション
  def index
    #選択された子カテゴリーに紐付く孫カテゴリーの配列を取得
    @category_grandchildren = Category.find(params[:child_id]).children
  end
end
