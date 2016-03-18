class Appointment < ActiveRecord::Base
  belongs_to :student, class_name: 'User'
  belongs_to :tutor, class_name: 'User'
  validates :appointment_date, presence: true


  def available?(tutor_date)
    if tutor_date.profile.availability == self.appointment_date
      true
    else
      false
    end
  end

end
