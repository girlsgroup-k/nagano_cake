class Public::CartItemsController < ApplicationController
  def index
    @cart_items = CartItem.where(customer_id: current_customer.id)
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
    @cart_item = CartItem.new(cart_item_params)
    @cart_items = CartItem.find_by(customer_id: current_customer.id)
    if @new_cart_items = Item.find_by(id: @cart_item.item_id)
      new_quantity = @new_cart_items.itemcart_items.item_quantity.to_i + @cart_item.item_quantity.to_i
      cart_item.update_attribute(:item_quantity, new_quantity)
      @cart_item.delete
    else
      cart_item.save
    end
    @cart_items = CartItem.all
    redirect_to cart_items_path
  end
  
  private
  
  def cart_item_params
    params.require(:cart_item).permit(:customer_id, :item_id, :item_quantity)
  end
end
