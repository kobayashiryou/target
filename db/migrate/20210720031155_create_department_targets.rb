class CreateDepartmentTargets < ActiveRecord::Migration[6.1]
  def change
    create_table :department_targets do |t|
      t.string :monthly_target
      t.string :anually_target
      t.references :department, null: false, foreign_key: true

      t.timestamps
    end
  end
end
