class RemovePasswordFromCustomers < ActiveRecord::Migration[6.1]
  def change
    remove_column :customers, :password, :string
  end
end
