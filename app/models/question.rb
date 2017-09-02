class Question < ActiveRecord::Base
  belongs_to :paper
  belongs_to :subject
  has_many :options, dependent: :destroy
  accepts_nested_attributes_for :options, allow_destroy: true
  validates :assking_question, :type_of_question, :presence => true
end
