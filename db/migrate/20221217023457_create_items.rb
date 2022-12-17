class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|
      t.integer :genre_id, null: false, foreign_key: true
      t.string :name, null: false
      t.text :detail, null: false
      t.integer :tax_exclusive_price, null: false
      t.boolean :is_active, null: false, default: true
      t.timestamps
    end
  end
end
