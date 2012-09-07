class AddOldIdToEvents < ActiveRecord::Migration
  def change
    add_column :events, :old_id, :integer
  end
end
