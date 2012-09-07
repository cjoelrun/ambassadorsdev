class ChangeEventsHoursToDecimal < ActiveRecord::Migration
  def up
    change_column :events, :hours, :decimal, :precision => 4, :scale => 2
  end

  def down
    change_column :events, :hours, :integer
  end
end
