class AddRegistrationStatusIdToRegistrations < ActiveRecord::Migration
  def change
    add_column :registrations, :registration_status_id, :integer
  end
end
