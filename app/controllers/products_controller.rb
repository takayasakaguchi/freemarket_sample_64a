class ProductsController < ApplicationController
  # before_action :set_product, except: [:index, :new, :create]

  def show

  end

  def new
    @product = Product.new
    @products = Product.includes(:images).order('created_at DESC')
    @product.images.build
    @category_parent_array = []
    #データベースから、親カテゴリーのみ抽出し、配列化
    Category.where(ancestry: nil).each do |parent|
        @category_parent_array << parent
    end
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to root_path
    else
      render :new
    end
  end

  # def update
  #   if @product.update(product_params)
  #     redirect_to root_path
  #   else
  #     render :edit
  #   end
  # end

  # def destroy
  #   @product.destroy
  #   redirect_to root_path
  # end

   # 以下全て、formatはjsonのみ
   # 親カテゴリーが選択された後に動くアクション
   def get_category_children
    #選択された親カテゴリーに紐付く子カテゴリーの配列を取得
    @category_children = Category.find(params[:parent_name]).children
  end

  def get_category_grandchildren
    #選択された子カテゴリーに紐付く孫カテゴリーの配列を取得
    @category_grandchildren = Category.find(params[:child_id]).children
  end

  private
  def product_params
    params.require(:product).permit(:name, :price, :status, :lead_time, :postage, :size, :brand, :description, :prefecture_id, :category_id, images_attributes: [:image]).merge(user_id: User.find(1).id)
  end

  # def set_product
  #   @product = Product.find(params[:id])
  # end
end
