class Exam < ActiveRecord::Base
  belongs_to :level
  has_many :papers
  has_and_belongs_to_many :subjects
  
  has_and_belongs_to_many :students
  
validates :exam_name, :exam_date, :type_of_exam, :presence => true
  validate :checkdate
  def checkdate
    if exam_date
      errors.add(:exam_date, "Past Date should not be entered here") if exam_date <= Date.today
    end
  end

end
