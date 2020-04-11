class AddressesController < ApplicationController
  before_action :fetch_address, only: [:edit, :update, :destroy]

  def index
    @addresses = current_user.addresses
  end

  def new
    @address = current_user.addresses.new
  end

  def create
    @address = current_user.addresses.build(address_params)
    if @address.save
      redirect_to addresses_path, notice: '登録しました'
    else
      render :new
    end
  end

  def edit
    render :new
  end

  def update
    if @address.update_attributes(address_params)
      redirect_to addresses_path, notice: '更新しました'
    else
      render :new
    end
  end

  def destroy
    @address.destroy
    redirect_to addresses_path, notice: "削除しました"
  end

  private

  def fetch_address
    @address = current_user.addresses.find(params[:id])
  end

  def address_params
    params.require(:address).permit(
      :address_building,
      :address_city,
      :address_street,
      :post_code,
      :prefecture_name)
  end

end
