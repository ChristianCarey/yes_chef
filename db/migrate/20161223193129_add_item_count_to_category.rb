class AddItemCountToCategory < ActiveRecord::Migration[5.0]
  def change
    add_column :categories, :categories_menu_items_count, :integer, default: 0
  end
end
