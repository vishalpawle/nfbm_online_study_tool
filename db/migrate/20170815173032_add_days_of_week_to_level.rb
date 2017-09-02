class AddDaysOfWeekToLevel < ActiveRecord::Migration
  def change
    add_column :levels, :days_of_week, :string
  end
end
