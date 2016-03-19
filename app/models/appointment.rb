class Appointment < ActiveRecord::Base
  belongs_to :student, class_name: 'User'
  belongs_to :tutor, class_name: 'User'
  validates :appointment_date, presence: true


  def date_of_appointment
    self.appointment_date.strftime('%A %b %d, %Y %I:%M %P')
  end


  def available?(tutor_date)
    if tutor_date.profile.availability == self.appointment_date
      true
    else
      false
    end
  end

end
