class Admin::OrdersController < ApplicationController
  def show
    @order = Order.find(params[:id])
    @order_details = OrderDetail.where(order_id: @order.id)
    @total = 0
    @subtotal = 0
    @subtotals = 0
  end

  def update
    order = Order.find(params[:id])
    order.update(order_params)
    @order = Order.find(params[:id])
    @order_details = OrderDetail.where(order_id: @order.id)
    redirect_to admin_order_path
  end

  private

  def order_params
    params.require(:order).permit(:order_status)
  end
end
