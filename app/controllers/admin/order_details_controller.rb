class Admin::OrderDetailsController < ApplicationController
  def update
    @order_detail = OrderDetail.find(params[:id])
    @order_detail.update(order_detail_params)
    @order = Order.find_by(id: @order_detail.order_id)
    redirect_to admin_order_path(@order.id)
  end
  
  
  private
  
  def order_detail_params
    params.require(:order_detail).permit(:production_status)
  end
end
