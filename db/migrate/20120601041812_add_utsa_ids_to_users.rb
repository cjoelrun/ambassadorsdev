class AddUtsaIdsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :banner, :string
    add_column :users, :utsa_id, :string
  end
end
