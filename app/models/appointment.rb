class Appointment < ActiveRecord::Base
  belongs_to :student, class_name: 'User'
  belongs_to :tutor, class_name: 'User'

  validates :appointment_date, presence: true
  validate :available, :on => :create

  def available
    if @appointment.present? && tutor.profile.availability == self.appointment_date
      true
    else
      errors.add(:appointment_date, "Select only the Date and Time available for Tutor")
    end
  end

end
