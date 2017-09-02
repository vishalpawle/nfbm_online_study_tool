class CreateExamsStudents < ActiveRecord::Migration
  def change
    create_table :exams_students do |t|
      t.references :exam, index: true, foreign_key: true
      t.references :student, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
