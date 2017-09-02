class AddAsskingQuestionToQuestion < ActiveRecord::Migration
  def change
    add_column :questions, :assking_question, :text
  end
end
