class Admin::HomesController < ApplicationController
  def top
    @orders = Order.page(params[:page]).per(10)
    @order_details = OrderDetail.all
    @total = 0
  end
end
