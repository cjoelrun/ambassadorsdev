class AddServiceBooleanToCreditTypes < ActiveRecord::Migration
  def change
    add_column :credit_types, :service, :boolean
  end
end
