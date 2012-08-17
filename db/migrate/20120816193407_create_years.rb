class CreateYears < ActiveRecord::Migration
  def change
    create_table :years do |t|
      t.date :start
      t.date :end

      t.timestamps
    end
  end
end
