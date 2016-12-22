class CreateMenuItemOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :menu_item_orders do |t|
      t.references :menu_item, foreign_key: true, null: false
      t.references :order, foreign_key: true, null: false
      t.integer :quantity, null: false
      t.integer :sale_price_cents, null: false

      t.timestamps
    end
  end
end
