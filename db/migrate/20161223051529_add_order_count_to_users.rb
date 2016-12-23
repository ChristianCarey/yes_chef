class AddOrderCountToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :placed_orders_count, :integer
  end
end
