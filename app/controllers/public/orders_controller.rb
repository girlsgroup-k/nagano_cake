class Public::OrdersController < ApplicationController
  def new
  end

  def check
  end

  def create
    order = Order.new(order_params)
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
    @order_details = @order.order_details.all
  end

  private

  def order_params
    params.require(:order).permit(:id, :customer_id, :select_post_code, :select_address, :select_receiver, :postage, :billing_amount, :payment_method, :order_status)
  end
end
