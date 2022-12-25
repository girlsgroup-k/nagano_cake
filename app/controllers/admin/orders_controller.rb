class Admin::OrdersController < ApplicationController
  def show
    @order = Order.find(params[:id])
    @order_details = OrderDetail.where(order_id: @order.id)
    @total = 0  #請求金額合計
    @subtotal = 0  #小計
  end

  def update
    @order = Order.find(params[:id])
    if @order.update(order_params)
      @order_details = OrderDetail.where(order_id: @order.id)
      if @order.order_status == Order.order_statuses.key(1)
        @order_details.each do |order_detail|
          order_detail.update(production_status: 1)
        end
      end
    end
    @order = Order.find(params[:id])
    @order_details = OrderDetail.where(order_id: @order.id)
    redirect_to admin_order_path
  end
  private

  def order_params
    params.require(:order).permit(:order_status)
  end
end
