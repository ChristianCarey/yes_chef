class RenameMenuItemOrderToOrderItem < ActiveRecord::Migration[5.0]
  def change
    rename_table :menu_item_orders, :order_items
  end
end
