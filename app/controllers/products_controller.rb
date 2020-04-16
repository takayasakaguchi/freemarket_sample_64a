class ProductsController < ApplicationController
  # before_action :set_product, except: [:index, :new, :create]


  def show
    
  end

  def new
    @product = Product.new
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

  # def destroy
  #   @product.destroy
  #   redirect_to root_path
  # end

   # 以下全て、formatはjsonのみ
   # 親カテゴリーが選択された後に動くアクション
   def get_category_children
    #選択された親カテゴリーに紐付く子カテゴリーの配列を取得
    # @category_children = Category.find_by(name: "#{params[:parent_name]}", ancestry: nil).children
    @category_children = Category.find(params[:parent_name]).children
  end

  def get_category_grandchildren
    #選択された子カテゴリーに紐付く孫カテゴリーの配列を取得
    @category_grandchildren = Category.find(params[:child_name]).children
  end

  private
  def product_params
    params.require(:product).permit(:name, :price, :status, :lead_time, :postage, :brand, :description, :city, :images, :category_id, images_attributes: [:image]).merge(user_id: current_user.id)
  end

  # def set_product
  #   @product = Product.find(params[:id])
  # end
end
