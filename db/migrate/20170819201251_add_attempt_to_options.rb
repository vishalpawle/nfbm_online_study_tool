class AddAttemptToOptions < ActiveRecord::Migration
  def change
    add_reference :options, :attempt, index: true, foreign_key: true
  end
end
