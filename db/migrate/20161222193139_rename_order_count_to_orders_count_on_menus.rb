class RenameOrderCountToOrdersCountOnMenus < ActiveRecord::Migration[5.0]
  def change
    rename_column :menus, :order_count, :orders_count
  end
end
