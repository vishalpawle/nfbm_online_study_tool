class CreateLevelsStudents < ActiveRecord::Migration
  def change
    create_table :levels_students do |t|
      t.references :student, index: true, foreign_key: true
      t.references :level, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
