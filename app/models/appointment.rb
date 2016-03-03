class Appointment < ActiveRecord::Base
  belongs_to :student, class_name: 'User'
  belongs_to :tutor, class_name: 'User'

  validates :appointment_date, presence: true

  def available?
    
  end


end
