class CreateAttempts < ActiveRecord::Migration
  def change
    create_table :attempts do |t|
      t.integer :total_marks
      t.integer :require_marks
      t.date :attempted_date
      t.references :student, index: true, foreign_key: true
      t.references :paper, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
