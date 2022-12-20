class Item < ApplicationRecord
  has_one_attached :item_image
  belongs_to :genre
  has_many :cart_items
  has_many :orders, through: :cart_items
  
  def get_item_image(width, height)
    item_image.variant(resize_to_limit: [width, height]).processed
  end
  
  def with_tax_price
    (tax_exclusive_price * 1.1).floor
  end
end
