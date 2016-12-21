class CreateMenuItems < ActiveRecord::Migration[5.0]
  def change
    create_table :menu_items do |t|
      t.string :name, null: false
      t.text   :description, null: false
      t.references :user

      t.timestamps
    end
  end
end
