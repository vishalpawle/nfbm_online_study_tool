class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string :first_name
      t.string :last_name
      t.string :mid_name
      t.string :gender
      t.date :date_of_birth
      t.string :mobile_number
      t.string :email
      t.string :address_one
      t.string :address_two
      t.string :address_three
      t.string :city
      t.string :state
      t.integer :pin
      t.string :occupation
      t.string :qualification
      t.string :have_you_completed_any_computer_cource
      t.string :course_name
      t.string :computer_literacy_level
      t.string :percentages_of_blindness
      t.string :which_assistive_technology_do_you_use
      t.string :do_you_have_membership_of_nfbmpune
      t.boolean :tirms
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
