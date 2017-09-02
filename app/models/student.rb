class Student < ActiveRecord::Base
  belongs_to :user
  has_and_belongs_to_many :levels
    has_and_belongs_to_many :exams
  has_many :attempts, dependent: :destroy
  has_many :results, dependent: :destroy

  validates :first_name, :last_name, :date_of_birth, :gender, :occupation, :mobile_number, :email, :address_one, :address_two, :city, :state, :pin, :qualification, :computer_literacy_level, :percentages_of_blindness, :do_you_have_membership_of_nfbmpune, :tirms, :presence => true
  validates :first_name, :last_name, :format => {:with => /\A[a-zA-z]+\z/, :message => "Only letters allowed."}
  validates :mobile_number, :format => { with: /(^\s*$|^\s*[789]\d{9}\s*$)/, :message => " Number should be start from 7, 8, or 9. " }
  validates :mid_name, :format => {:with => /\A[a-zA-z]+\z/, :message => "Only letters allowed."}, :allow_blank => true
  validates :mobile_number, :email, :uniqueness => true
  validate :ckdob
  def ckdob
    if date_of_birth
      if date_of_birth >= Date.today
        errors.add(:date_of_birth, "Do not allow to enter future date.")
      elsif date_of_birth.year > Date.today.year - 16
        errors.add(:date_of_birth, "Please enter the 18 year before date.")
      end
    end
  end
end
