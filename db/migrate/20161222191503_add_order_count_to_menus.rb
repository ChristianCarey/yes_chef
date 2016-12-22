class AddOrderCountToMenus < ActiveRecord::Migration[5.0]
  def change
    add_column :menus, :order_count, :integer, default: 0
  end
end
