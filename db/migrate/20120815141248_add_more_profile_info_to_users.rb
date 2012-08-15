class AddMoreProfileInfoToUsers < ActiveRecord::Migration
  def change
    add_column :users, :major, :string
    add_column :users, :hours_enrolled, :integer
    add_column :users, :graduation_date, :string
    add_column :users, :hometown, :string
    add_column :users, :committee_id, :integer
  end
end
