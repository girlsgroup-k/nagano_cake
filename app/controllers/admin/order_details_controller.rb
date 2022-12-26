class Admin::OrderDetailsController < ApplicationController
  def update
    @order_detail = OrderDetail.find(params[:id])
    @order = Order.find_by(id: @order_detail.order_id)
    @order_details = @order.order_details.all

    if @order_detail.update(order_detail_params)
      if @order_detail.production_status == OrderDetail.production_statuses.key(2)
        @order_detail.order.update(order_status: 2)
      end
      production_status_check = true
      @order_details.each do |order_detail|
        if order_detail.production_status != OrderDetail.production_statuses.key(3)
          production_status_check = false
        end
      end
      if production_status_check == true
        @order_detail.order.update(order_status: 3)
      end
    end
    redirect_to admin_order_path(@order.id)
  end


  private

  def order_detail_params
    params.require(:order_detail).permit(:production_status)
  end
end
