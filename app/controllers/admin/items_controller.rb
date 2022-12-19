class Admin::ItemsController < ApplicationController
  def index
    @item = Item.new
    @items = Item.page(params[:page]).per(10)
  end

  def new
    @item = Item.new
  end

  def create
    item = Item.new(item_params)
    item.save
    redirect_to admin_item_path(item)
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
  end

  private

  def item_params
    params.require(:item).permit(:item_image, :name, :detail, :genre_id, :tax_exclusive_price, :is_active)
  end
end
