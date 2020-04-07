class AddressController < ApplicationController
  def index
    @address = Address.new
  end

  def create
    # ユーザーはダミーデータを使用して登録
    @address = Address.create(address_params)
    if @address.save
      redirect_to purchases_path
    else
      render action: :index
    end
  end

  def edit

  end

private
  def address_params
    params.require(:address).permit(:first_name, :last_name, :first_name_reading, :last_name_reading, :postal_code, :prefecture_id, :city, :house_number, :building_name, :phone_number).merge(user_id: User.find(1).id)
  end

end
