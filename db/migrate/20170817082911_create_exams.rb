class CreateExams < ActiveRecord::Migration
  def change
    create_table :exams do |t|
      t.string :exam_name
      t.date :exam_date
      t.text :exam_discription
      t.text :exam_instructions
      t.references :level, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
