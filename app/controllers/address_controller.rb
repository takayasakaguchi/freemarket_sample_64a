class AddressController < ApplicationController

  before_action :set_address, only: [:edit, :update]

  def index
    @address = current_user.address
    @parents = Category.roots
  end

  def new
    @address = Address.new
  end

  def create
    @address = Address.new(address_params)
    if @address.save
      redirect_to controller: "mypage", action: 'index'
      flash[:notice] = '住所を登録しました。'
    else
      render action: :new
    end
  end

  def edit
  end

  def update
    if @address.update(address_params)
      redirect_to controller: "mypage", action: 'index'
      flash[:notice] = '住所を変更しました。'
    else
      render action: :edit
    end
  end

private
  def address_params
    params.require(:address).permit(:first_name, :last_name, :first_name_reading, :last_name_reading, :postal_code, :prefecture_id, :city, :house_number, :building_name, :phone_number).merge(user_id: current_user.id)
  end

  def set_address
    @address = Address.includes(:user).find(params[:id])
  end
end
