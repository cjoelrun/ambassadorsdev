class AddEventAndCreditTypeIdsToEvents < ActiveRecord::Migration
  def change
    add_column :events, :event_type_id, :integer
    add_column :events, :credit_type_id, :integer
  end
end
