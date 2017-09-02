class CreateChapters < ActiveRecord::Migration
  def change
    create_table :chapters do |t|
      t.string :chapter_name
      t.text :chapter_discription
      t.references :subject, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
