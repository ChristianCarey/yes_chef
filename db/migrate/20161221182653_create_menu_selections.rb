class CreateMenuSelections < ActiveRecord::Migration[5.0]
  def change
    create_table :menu_selections do |t|
      t.references :menu_item, foreign_key: true
      t.references :menu, foreign_key: true

      t.timestamps
    end
  end
end
