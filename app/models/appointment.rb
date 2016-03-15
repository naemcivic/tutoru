class Appointment < ActiveRecord::Base
  belongs_to :student, class_name: 'User'
  belongs_to :tutor, class_name: 'User'

  validates :appointment_date, presence: true

  def available?(appointment_date, tutor_availability)
      tutor_availability_array = tutor_availability.split(",")
    if tutor_availability_array.include? appointment_date
      true
    else
      false
    end
  end
end
