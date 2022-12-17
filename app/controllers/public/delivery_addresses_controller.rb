class Public::DeliveryAddressesController < ApplicationController
  def index
    @delivery_address = DeliveryAddress.new
  end

  def edit
  end

  def create
    @delivery_address = DeliveryAddress.new(delivery_address_params)
    @delivery_address.costomer_id = current_costomer.id
    @delivery_address.save
    redirect_to delivery_addresses_path
  end

  def update
  end

  def destroy
  end
  
    private

  def delivery_address_params
    params.require(:delivery_address).permit(:post_code, :address, :name)
  end
  
end
