class CreateExamsSubjects < ActiveRecord::Migration
  def change
    create_table :exams_subjects do |t|
      t.references :exam, index: true, foreign_key: true
      t.references :subject, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
