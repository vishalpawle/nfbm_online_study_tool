class CreatePapers < ActiveRecord::Migration
  def change
    create_table :papers do |t|
      t.time :exam_time
      t.string :paper_name
      t.boolean :attempt_flag
      t.boolean :current_paper_flag
      t.references :exam, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
