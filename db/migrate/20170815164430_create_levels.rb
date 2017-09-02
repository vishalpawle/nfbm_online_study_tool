class CreateLevels < ActiveRecord::Migration
  def change
    create_table :levels do |t|
      t.string :title
      t.date :start_date
      t.date :end_date
      t.integer :duration
      t.time :start_time
      t.time :end_time
      t.text :level_remarks

      t.timestamps null: false
    end
  end
end
