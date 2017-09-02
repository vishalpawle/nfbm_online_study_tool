class Paper < ActiveRecord::Base
  belongs_to :exam
  has_many :attempts
  has_many :questions, dependent: :destroy

end
