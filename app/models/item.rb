class Item < ApplicationRecord
  has_one_attached :item_image
  belongs_to :genre
  has_many :cart_items
  has_many :order_details
  
  def get_item_image(width, height)
    unless item_image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    item_image.variant(resize_to_fill: [width, height]).processed
  end
  
  def with_tax_price
    (tax_exclusive_price * 1.1).floor
  end
  
end
