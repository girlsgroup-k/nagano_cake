class Order < ApplicationRecord
  belongs_to :customer
  has_many :order_details
  
  validates :select_post_code, presence: true
  validates :select_address, presence: true
  validates :select_receiver, presence: true
  validates :payment_method, presence: true
  validates :order_id, presence: true
  validates :item_id, presence: true
  validates :tax_included_price, presence: true
  validates :quantity, presence: true
  validates :production_status, presence: true
  
  enum payment_method: { credit_card: 0, transfer: 1 }
end
