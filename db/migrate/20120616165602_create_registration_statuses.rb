class CreateRegistrationStatuses < ActiveRecord::Migration
  def change
    create_table :registration_statuses do |t|
      t.string :name

      t.timestamps
    end
  end
end
