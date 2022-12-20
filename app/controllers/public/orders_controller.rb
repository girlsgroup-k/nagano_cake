class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
  end

  def check
    if params[:order][:address_option] == "0"
      @order = Order.new(order_params)
      @order.select_post_code = current_member.post_code
      @order.select_address = current_member.address
      @order.select_receiver = current_member.first_name + current_member.last_name
    elsif params[:order][:address_option] == "1"
      @order = Order.new(order_params)
      @address = DeliveryAddress.find(params[:order][:delivery_address_id])
      @order.select_post_code = @address.post_code
      @order.select_address = @address.address
      @order.select_receiver = @address.name
    elsif params[:order][:address_option] == "2"
      
    
    else
      
    end
      
  end

  def create
    @order = Order.new(order_params)
    @cart_items = CartItem.all 
    redirect_to new_order_path
  end

  def success
     @cart_items.destroy_all
  end

  def index
  end

  def show
    @order = Order.find(params[:id])
  end
  
  private
  
  def order_params
    params.require(:order).permit(:id, :customer_id, :select_post_code, :select_address, :select_receiver, :postage, :billing_amount, :payment_method, :order_status)
  end
end
