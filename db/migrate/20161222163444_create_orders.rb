class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.integer :chef_id, null: false
      t.integer :customer_id, null: false

      t.timestamps
    end

    add_index :orders, [:chef_id, :customer_id]
  end
end
