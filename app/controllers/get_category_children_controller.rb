class GetCategoryChildrenController < ApplicationController
  # 商品編集ページで親カテゴリーが選択された後に動くアクション
  def index
    #選択された親カテゴリーに紐付く子カテゴリーの配列を取得
    @category_children = Category.find_by(name: "#{params[:parent_name]}", ancestry: nil).children
  end
end
