class CreateSubjects < ActiveRecord::Migration
  def change
    create_table :subjects do |t|
      t.string :subject_name
      t.text :subject_discription
      t.references :level, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
