class DeliveryAddress < ApplicationRecord
  belongs_to :customer
  
  def address_display
  　'〒' + post_code + ' ' + address + ' ' + name
  end
end