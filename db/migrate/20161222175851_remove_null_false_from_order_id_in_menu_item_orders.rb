class RemoveNullFalseFromOrderIdInMenuItemOrders < ActiveRecord::Migration[5.0]
  def change
    change_column :menu_item_orders, :order_id, :integer, null: true
  end
end
