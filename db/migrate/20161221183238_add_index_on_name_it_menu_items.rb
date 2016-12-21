class AddIndexOnNameItMenuItems < ActiveRecord::Migration[5.0]
  def change
    add_index :menu_items, [:user_id, :name]
    add_index :menu_items, [:name, :user_id]
  end
end
