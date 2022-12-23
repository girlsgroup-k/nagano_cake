class Public::HomesController < ApplicationController
  def top
    @items = Item.first(4)
  end

  def about
  end
end
