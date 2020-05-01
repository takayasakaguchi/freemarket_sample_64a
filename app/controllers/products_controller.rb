class ProductsController < ApplicationController

  before_action :set_product,only: [:destroy, :show, :edit, :update]

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
    grandchild_category = @product.category
    child_category = grandchild_category.parent


    @category_parent_array = []
    Category.where(ancestry: nil).each do |parent|
      @category_parent_array << parent.name
    end

    @category_children_array = []
    Category.where(ancestry: child_category.ancestry).each do |children|
      @category_children_array << children
    end

    @category_grandchildren_array = []
    Category.where(ancestry: grandchild_category.ancestry).each do |grandchildren|
      @category_grandchildren_array << grandchildren
    end
    
  end

  def update
    if @product.update(product_params)
      redirect_to root_path
    else
      redirect_to product_path(@product)
      flash[:alert] = '変更に失敗しました。必須項目を入力してください'
    end
  end

  private
  def product_params
    params.require(:product).permit(:name, :price, :status, :lead_time, :postage, :size, :brand, :description, :prefecture_id, :category_id, images_attributes: [:image, :_destroy, :id]).merge(user_id: User.find(1).id)
  end

  def set_product
    @product = Product.find(params[:id])
  end

end
