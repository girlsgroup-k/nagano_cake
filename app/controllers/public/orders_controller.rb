class Public::OrdersController < ApplicationController
  def new
  end

  def check
  end

  def create
    order = Order.new(order_params)
    order.save
    @cart_items = CartItem.all 
    @cart_items.destroy_all
    redirect_to new_order_path
  end

  def success
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
