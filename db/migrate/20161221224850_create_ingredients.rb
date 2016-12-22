class CreateIngredients < ActiveRecord::Migration[5.0]
  def change
    create_table :ingredients do |t|
      t.string :name, null: false
      t.references :user, foreign_key: true

      t.timestamps
    end
    add_index :ingredients, [:user_id, :name], unique: true
  end
end
