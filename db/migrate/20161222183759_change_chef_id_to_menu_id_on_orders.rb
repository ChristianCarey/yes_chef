class ChangeChefIdToMenuIdOnOrders < ActiveRecord::Migration[5.0]
  def change
    rename_column :orders, :chef_id, :menu_id
  end
end
