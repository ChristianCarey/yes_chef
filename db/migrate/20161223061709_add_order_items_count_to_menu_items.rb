class AddOrderItemsCountToMenuItems < ActiveRecord::Migration[5.0]
  def change
    add_column :menu_items, :order_items_count, :integer, default: 0
  end
end
