class GetCategoryChildrenController < ApplicationController
  # 商品出品ページでvalidationにかかった時用のアクション
  # 商品出品ページで親カテゴリーが選択された後に動くアクション
  def index
    #選択された親カテゴリーに紐付く子カテゴリーの配列を取得
    @category_children = Category.find(params[:parent_name]).children
  end
end
