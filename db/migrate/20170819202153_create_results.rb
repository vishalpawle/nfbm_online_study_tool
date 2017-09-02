class CreateResults < ActiveRecord::Migration
  def change
    create_table :results do |t|
      t.integer :get_marks
      t.integer :total_marks
      t.string :result_status
      t.integer :min_marks
      t.references :attempt, index: true, foreign_key: true
      t.references :student, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
