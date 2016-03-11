class Appointment < ActiveRecord::Base
  belongs_to :student, class_name: 'User'
  belongs_to :tutor, class_name: 'User'

  validates :appointment_date, presence: true


  def available?(appointment_date, tutor_availability )
    if tutor_availability == appointment_date
      true
    else
      false
    end
  end

end
