class CreateCategoriesMenuItems < ActiveRecord::Migration[5.0]
  def change
    create_table :categories_menu_items do |t|
      t.references :category, foreign_key: true
      t.references :menu_item, foreign_key: true

      t.timestamps
    end
  end
end
