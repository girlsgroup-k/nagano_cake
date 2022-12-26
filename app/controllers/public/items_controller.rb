class Public::ItemsController < ApplicationController
  def index
    @item = Item.new
    @item = Item.where(is_active: true)
    @items = @item.page(params[:page]).per(8)
    @genres = Genre.all
  end

  def show
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
    @genres = Genre.all
  end


end

