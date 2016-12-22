class AddChefAndCustomersToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :chef_id, :integer, foreign_key: true
  end
end
