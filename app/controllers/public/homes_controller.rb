class Public::HomesController < ApplicationController
  def top
    @items = Item.first(4)
    @genres = Genre.all
  end

  def about
  end
end
