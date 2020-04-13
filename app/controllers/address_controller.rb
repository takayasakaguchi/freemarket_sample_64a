class AddressController < ApplicationController
  def index
    @address = Address.new
  end

  def create
    @address = Address.create(address_params)
    if @address.save
      redirect_to purchases_path
    else
      render action: :index
    end
  end

  def edit
    @address = Address.includes(:user).find(params[:id])
  end

  def update
    address = Address.includes(:user).find(params[:id])
    address.update(address_params)
    redirect_to purchases_path
  end

private
  def address_params
    params.require(:address).permit(:first_name, :last_name, :first_name_reading, :last_name_reading, :postal_code, :prefecture_id, :city, :house_number, :building_name, :phone_number).merge(user_id: current_user.id)
  end

end
