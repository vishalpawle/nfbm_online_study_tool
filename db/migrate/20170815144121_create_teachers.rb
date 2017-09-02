class CreateTeachers < ActiveRecord::Migration
  def change
    create_table :teachers do |t|
      t.string :first_name
      t.string :last_name
      t.string :gender
      t.date :date_of_birth
      t.string :mobile_number
      t.string :email
      t.string :listening_skills_jaws
      t.string :writing_skills_with_jaws
      t.text :strengths
      t.text :weaknesses
      t.boolean :tirms
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
