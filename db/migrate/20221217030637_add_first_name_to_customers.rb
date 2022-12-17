class AddFirstNameToCustomers < ActiveRecord::Migration[6.1]
  def change
    add_column :customers, :first_name, :string, null: false
    add_column :customers, :last_name, :string, null: false
    add_column :customers, :first_name_kana, :string, null: false
    add_column :customers, :last_name_kana, :string, null: false
    add_column :customers, :post_code, :string, null: false
    add_column :customers, :address, :text, null: false
    add_column :customers, :phone_number, :string, null: false
    add_column :customers, :password, :string, null: false
    add_column :customers, :is_deleted, :boolean, null: false, default: false
  end
end
