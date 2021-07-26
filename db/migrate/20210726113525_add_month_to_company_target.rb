class AddMonthToCompanyTarget < ActiveRecord::Migration[6.1]
  def change
    add_column :company_targets, :month, :integer
  end
end
