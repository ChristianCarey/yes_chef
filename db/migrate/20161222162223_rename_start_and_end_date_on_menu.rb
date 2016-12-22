class RenameStartAndEndDateOnMenu < ActiveRecord::Migration[5.0]
  def change
    rename_column :menus, :start_date, :order_deadline
    rename_column :menus, :end_date, :completion_date
  end
end
