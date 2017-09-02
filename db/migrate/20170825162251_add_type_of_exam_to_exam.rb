class AddTypeOfExamToExam < ActiveRecord::Migration
  def change
    add_column :exams, :type_of_exam, :string
  end
end
