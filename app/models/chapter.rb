class Chapter < ActiveRecord::Base
  belongs_to :subject
  validates :chapter_name, :chapter_discription, :presence => true
end
