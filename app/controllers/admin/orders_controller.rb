class Admin::OrdersController < ApplicationController
  def show
    @order = Order.find(params[:id])
    @order_details = OrderDetail.where(order_id: @order.id)
  end

  def update
    order = Order.find(params[:id])
    order.update(order_params)
    @order_detail = OrderDetail.find(params[:id])
    redirect_to order_path
  end
  
  private
  
  def order_params
    params.require(:order).permit(:order_status)
  end
end
