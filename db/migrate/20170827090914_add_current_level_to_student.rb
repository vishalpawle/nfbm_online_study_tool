class AddCurrentLevelToStudent < ActiveRecord::Migration
  def change
    add_column :students, :current_level, :integer
  end
end
