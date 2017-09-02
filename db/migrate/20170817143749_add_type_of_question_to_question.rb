class AddTypeOfQuestionToQuestion < ActiveRecord::Migration
  def change
    add_column :questions, :type_of_question, :string
  end
end
