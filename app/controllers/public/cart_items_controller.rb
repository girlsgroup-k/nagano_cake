class Public::CartItemsController < ApplicationController
  def index
    @cart_items = CartItem.all
    @total = 0
    @order = Order.new
  end

  def update
    cart_item = CartItem.find(params[:id])
    cart_item.update(cart_item_params)
    @cart_items = CartItem.all
    redirect_to cart_items_path
  end
  
  def destroy_all
    current_customer.cart_items.destroy_all
    redirect_to cart_items_path
  end

  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    @cart_items = CartItem.all
    redirect_to cart_items_path
  end

  def create
    cart_item = CartItem.new(cart_item_params)
    cart_item.save
    @cart_items = CartItem.all
    redirect_to cart_items_path
  end
  
  private
  
  def cart_item_params
    params.require(:cart_item).permit(:customer_id, :item_id, :item_quantity)
  end
end
