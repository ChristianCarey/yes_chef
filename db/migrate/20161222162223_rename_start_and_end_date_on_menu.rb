class RenameStartAndEndDateOnMenu < ActiveRecord::Migration[5.0]
  def change
    rename_column :menus, :order_deadline, :order_deadline
    rename_column :menus, :completion_date, :completion_date
  end
end
