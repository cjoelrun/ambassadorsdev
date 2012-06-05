class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :title
      t.date :date
      t.time :start_time
      t.time :end_time
      t.integer :members_needed
      t.integer :hours
      t.string :location
      t.text :instructions
      t.boolean :ait

      t.timestamps
    end
  end
end
