class AddMonthToDepartmentTarget < ActiveRecord::Migration[6.1]
  def change
    add_column :department_targets, :month, :integer
  end
end
