class OrderDetail < ApplicationRecord
  belongs_to :order
  belongs_to :item
  enum production_status: { not_allowed: 0, pending_production: 1, in_production: 2, production_completed: 3 }
  
end
