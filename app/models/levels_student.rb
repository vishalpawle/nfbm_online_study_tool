class LevelsStudent < ActiveRecord::Base
  belongs_to :student
  belongs_to :level
end
