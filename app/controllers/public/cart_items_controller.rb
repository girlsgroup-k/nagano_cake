class Public::CartItemsController < ApplicationController
  def index
    @cart_items = CartItem.all
  end

  def update
  end

  def destroy
  end

  def destroy_all
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
