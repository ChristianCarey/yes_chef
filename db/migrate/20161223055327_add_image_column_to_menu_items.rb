class AddImageColumnToMenuItems < ActiveRecord::Migration[5.0]
  def up
    add_attachment :menu_items, :image
    add_column :menu_items, :url, :string
  end

  def down
    remove_attachment :menu_items, :image
    remove_column :menu_items, :url, :string
  end
end
