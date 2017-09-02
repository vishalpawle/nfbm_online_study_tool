class Attempt < ActiveRecord::Base
  belongs_to :student
  belongs_to :paper
  has_many :options, dependent: :destroy
  has_one :result
end
