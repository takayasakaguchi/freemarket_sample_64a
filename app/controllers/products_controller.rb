class ProductsController < ApplicationController

  before_action :set_product,only: [:destroy, :show]

  def show
    @images = @product.images
  end

  def new
    @product = Product.new
    @products = Product.includes(:images).order('created_at DESC')
    @product.images.build
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to root_path
    else
      @product.images.build
      render :new
    end
  end

   # 以下全て、formatはjsonのみ
   # 親カテゴリーが選択された後に動くアクション
  def get_category_children
    #選択された親カテゴリーに紐付く子カテゴリーの配列を取得
    @category_children = Category.find(params[:parent_name]).children
  end

  def get_category_grandchildren
    #選択された子カテゴリーに紐付く孫カraigテゴリーの配列を取得
    @category_grandchildren = Category.find(params[:child_id]).children
  end

  def destroy
    if @product.destroy 
      redirect_to root_path
      
    else
      render_from StandardError, with: :render_500 unless Rails.env.development?
    end
  end

  def edit

  end

  private
  def product_params
    params.require(:product).permit(:name, :price, :status, :lead_time, :postage, :size, :brand, :description, :prefecture_id, :category_id, images_attributes: [:image]).merge(user_id: User.find(1).id)
  end

  def set_product
    @product = Product.find(params[:id])
  end

end
