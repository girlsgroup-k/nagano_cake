class Admin::OrdersController < ApplicationController
  def show
    @order_detail = OrderDetail.find(params[:id])
  end

  def update
  end
end
