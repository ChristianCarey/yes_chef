class AddItemNameToOrderItems < ActiveRecord::Migration[5.0]
  def change
    add_column :order_items, :item_name, :string
    change_column :order_items, :menu_item_id, :integer, null: true
  end
end
