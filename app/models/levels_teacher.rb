class LevelsTeacher < ActiveRecord::Base
  belongs_to :level
  belongs_to :teacher
end
