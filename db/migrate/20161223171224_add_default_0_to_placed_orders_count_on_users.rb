class AddDefault0ToPlacedOrdersCountOnUsers < ActiveRecord::Migration[5.0]
  def change
    change_column :users, :placed_orders_count, :integer, default: 0
  end
end
