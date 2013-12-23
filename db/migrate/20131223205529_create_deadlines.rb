class CreateDeadlines < ActiveRecord::Migration
  def change
    create_table :deadlines do |t|
      t.string :name
      t.datetime :deadline

      t.timestamps
    end
  end
end
