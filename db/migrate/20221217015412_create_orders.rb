class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.integer :customer_id, null: false, foreign_key: true
      t.string :select_post_code, null: false
      t.text :select_address, null: false
      t.string :select_receiver, null: false
      t.integer :postage, null: false, default: 800
      t.integer :billing_amount, null: false
      t.integer :payment_method, null: false, default: 0
      t.integer :order_status, null: false, default: 0
      t.timestamps
    end
  end
end
