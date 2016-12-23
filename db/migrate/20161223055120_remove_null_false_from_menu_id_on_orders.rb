class RemoveNullFalseFromMenuIdOnOrders < ActiveRecord::Migration[5.0]
  def change
    change_column :orders, :menu_id, :integer, null: true
  end
end
