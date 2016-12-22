class AddColumnPriceToMenuItems < ActiveRecord::Migration[5.0]
  def change
    add_column :menu_items, :price_cents, :integer, null: false
  end
end
