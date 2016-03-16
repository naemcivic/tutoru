class Appointment < ActiveRecord::Base
  belongs_to :student, class_name: 'User'
  belongs_to :tutor, class_name: 'User'

  validates :appointment_date, presence: true

  def available?(appointment_date, tutor_availability)
      appointment_date_array = appointment_date.split(",")
      tutor_availability_array = tutor_availability.split(",")
    if (appointment_date_array - tutor_availability_array).empty?
      true
    else
      false
    end
  end
end
