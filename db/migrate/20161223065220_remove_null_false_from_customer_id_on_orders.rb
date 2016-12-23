class RemoveNullFalseFromCustomerIdOnOrders < ActiveRecord::Migration[5.0]
  def change
    change_column :orders, :customer_id, :integer, null: true
  end
end
