class Public::OrdersController < ApplicationController
  def new
    @order = Order.new(order_params)
  end

  def check
    @order = Order.new(order_params)
    if params[:order][:address_option] == "0"
      @order.select_post_code = current_customer.post_code
      @order.select_address = current_customer.address
      @order.select_receiver = current_customer.first_name + current_customer.last_name
    elsif params[:order][:address_option] == "1"
      @address = DeliveryAddress.find(params[:order][:delivery_address_id])
      @order.select_post_code = @address.post_code
      @order.select_address = @address.address
      @order.select_receiver = @address.name
    elsif params[:order][:address_option] == "2"
      
    else
      render :new
    end
    @cart_items = CartItem.all
    @total = 0
  end
  def create
    @order = Order.new(order_params)
    @order.save!
    @cart_items = CartItem.where(customer_id: current_customer.id)
    @cart_items.each do |cart_item|
      @order_detail = OrderDetail.new
      @order_detail.order_id = @order.id
      @order_detail.item_id = cart_item.item_id
      @order_detail.tax_included_price = cart_item.item.tax_exclusive_price * 1.1
      @order_detail.quantity = cart_item.item_quantity
      @order_detail.save
    end
    @cart_items.destroy_all
    redirect_to orders_success_path
    

  end

  def success
  end

  def index
  end

  def show
    @order = Order.find(params[:id])
    @order_details = @order.order_details.all
  end

  private

  def order_params
    params.require(:order).permit(:customer_id, :select_post_code, :select_address, :select_receiver, :postage, :billing_amount, :payment_method, :order_status)
  end
  
  def order_detail_params
    params.require(:order_detail).permit(:id, :order_id, :item_id, :tax_included_price, :quantity, :production_status)
  end
end
