class MakeRoleNotNilForUsers < ActiveRecord::Migration[5.0]
  def change
    change_column :users, :role, :string, null: false
  end
end
