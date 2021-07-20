class CreateTodoTargets < ActiveRecord::Migration[6.1]
  def change
    create_table :todo_targets do |t|
      t.string :body
      t.references :department, null: false, foreign_key: true

      t.timestamps
    end
  end
end
