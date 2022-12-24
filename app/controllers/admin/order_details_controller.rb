class Admin::OrderDetailsController < ApplicationController
  def update
    @order_detail = OrderDetail.find(params[:id])
    if @order_detail.update(order_detail_params)
      if @order_detail.production_status == OrderDetail.production_statuses.key(2)
        @order_detail.order.update(order_status: 2)
      else @order_detail.production_status == OrderDetail.production_statuses.key(3)
        @order_detail.order.update(order_status: 3)
      end
    end
    @order = Order.find_by(id: @order_detail.order_id)
    redirect_to admin_order_path(@order.id)
  end
  
  
  private
  
  def order_detail_params
    params.require(:order_detail).permit(:production_status)
  end
end
