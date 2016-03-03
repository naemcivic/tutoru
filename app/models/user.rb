class User < ActiveRecord::Base
  has_many :student_appointments, class_name: 'Appointment', foreign_key: 'student_id'
  has_many :tutor_appointments, class_name: 'Appointment', foreign_key: 'tutor_id'
  has_one :profile

  accepts_nested_attributes_for :profile, reject_if: :all_blank


  authenticates_with_sorcery!

  validates :password, length: { minimum: 3 }, if: -> { new_record? || changes["password"] }
  validates :password, confirmation: true, if: -> { new_record? || changes["password"] }
  validates :password_confirmation, presence: true, if: -> { new_record? || changes["password"] }

  validates :email, uniqueness: true

  def student?
    #This method is to check for a boolean value column student on users table,
    #if false the user is a tutor.
      if self.student == false
        true
      else
        false
      end
  end


    def available?
      
    end


end
