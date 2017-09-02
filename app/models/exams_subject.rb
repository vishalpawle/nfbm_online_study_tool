class ExamsSubject < ActiveRecord::Base
  belongs_to :exam
  belongs_to :subject
end
