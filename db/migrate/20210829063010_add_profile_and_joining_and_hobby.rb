class AddProfileAndJoiningAndHobby < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :profile, :string
    add_column :users, :joining, :date
    add_column :users, :hobby, :string
  end
end
