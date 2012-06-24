class AddApparelIdsToEvents < ActiveRecord::Migration
  def change
    add_column :events, :apparel_id, :integer
  end
end
