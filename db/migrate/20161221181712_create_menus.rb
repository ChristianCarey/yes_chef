class CreateMenus < ActiveRecord::Migration[5.0]
  def change
    create_table :menus do |t|
      t.date :start_date, null: false
      t.date :end_date
      t.references :user

      t.timestamps
    end
  end
end
