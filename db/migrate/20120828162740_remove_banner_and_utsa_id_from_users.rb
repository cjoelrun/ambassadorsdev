class RemoveBannerAndUtsaIdFromUsers < ActiveRecord::Migration
  def up
    remove_column :users, :banner
    remove_column :users, :utsa_id
  end

  def down
    add_column :users, :banner, :string
    add_column :users, :utsa_id, :string
  end
end
