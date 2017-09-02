class Subject < ActiveRecord::Base
  belongs_to :level
    has_and_belongs_to_many :exams
  has_many :questions, dependent: :destroy
  has_many :chapters, dependent: :destroy
  validates :subject_name, :presence => true
end
