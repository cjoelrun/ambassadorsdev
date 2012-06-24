class CreateApparels < ActiveRecord::Migration
  def change
    create_table :apparels do |t|
      t.string :name

      t.timestamps
    end
  end
end
