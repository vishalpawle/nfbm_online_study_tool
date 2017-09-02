class Level < ActiveRecord::Base
  has_and_belongs_to_many :students
has_and_belongs_to_many :teachers
  has_many :subjects, dependent: :destroy
  has_many :exams, dependent: :destroy
  validates :title, :start_date, :end_date, :days_of_week, :presence => true
  validate :checkdate
  validate :pastdate
  validate :endpastdate
  def checkdate
    if end_date && start_date
      errors.add(:end_date, "End date should not be smaller than start date ") if end_date < start_date
    end
  end
  def pastdate
    if end_date && start_date
      errors.add(:start_date, "Past date is not permited") if start_date < Date.today
    end
  end

  def endpastdate
    if end_date && start_date
      errors.add(:end_date, "Past date is not permited") if end_date < Date.today
    end
  end
end
