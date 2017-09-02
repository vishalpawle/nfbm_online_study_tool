class CreateLevelsTeachers < ActiveRecord::Migration
  def change
    create_table :levels_teachers do |t|
      t.references :level, index: true, foreign_key: true
      t.references :teacher, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
