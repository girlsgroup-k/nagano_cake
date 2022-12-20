class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :delivery_addresses, foreign_key: :delivery_address_id, dependent: :destroy
  has_many :cart_items
  has_many :orders, foreign_key: :customer_id
end
