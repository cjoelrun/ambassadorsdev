class AddProfileInfoToUsers < ActiveRecord::Migration
  def change
    add_column :users, :phone, :string
    add_column :users, :birthday, :date
    add_column :users, :local_street, :string
    add_column :users, :local_city, :string
    add_column :users, :local_state, :string
    add_column :users, :local_zip, :string
    add_column :users, :local_apt, :string
    add_column :users, :permanent_street, :string
    add_column :users, :permanent_city, :string
    add_column :users, :permanent_state, :string
    add_column :users, :permanent_zip, :string
    add_column :users, :permanent_apt, :string
    add_column :users, :same_address, :boolean
    add_column :users, :tour_trained, :boolean
  end
end
