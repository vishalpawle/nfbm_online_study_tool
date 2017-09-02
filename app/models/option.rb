class Option < ActiveRecord::Base
  belongs_to :question
  belongs_to :attempt
  validates :option_name, :presence => true
end
