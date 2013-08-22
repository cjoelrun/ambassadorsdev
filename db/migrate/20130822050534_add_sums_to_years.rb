class AddSumsToYears < ActiveRecord::Migration
  def change
    add_column :years, :servicehours, :decimal, :precision =>7, :scale => 2
    add_column :years, :tours, :integer
  end
end
