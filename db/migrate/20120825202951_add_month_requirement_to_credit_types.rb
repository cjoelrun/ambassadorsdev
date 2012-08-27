class AddMonthRequirementToCreditTypes < ActiveRecord::Migration
  def change
    add_column :credit_types, :month_requirement, :integer
  end
end
