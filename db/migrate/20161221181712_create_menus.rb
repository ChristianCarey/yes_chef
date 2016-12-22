class CreateMenus < ActiveRecord::Migration[5.0]
  def change
    create_table :menus do |t|
      t.date :order_deadline, null: false
      t.date :completion_date
      t.references :user

      t.timestamps
    end
  end
end
