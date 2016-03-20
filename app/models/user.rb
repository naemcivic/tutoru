class User < ActiveRecord::Base
  has_many :student_appointments, class_name: 'Appointment', foreign_key: 'student_id', dependent: :destroy
  has_many :tutor_appointments, class_name: 'Appointment', foreign_key: 'tutor_id', dependent: :destroy
  has_one :profile, dependent: :destroy

  accepts_nested_attributes_for :profile, \
  :reject_if => proc {|attributes| attributes['avatar'].blank? \
  && attributes['avatar_cache'].blank?}

  authenticates_with_sorcery!

  acts_as_votable
  acts_as_voter

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

  #create method to format the member's join date
  def member_since
    self.created_at.strftime('%^b %d %Y')
  end

  #display logic for video conference
  def available_to_video_conf
      self.profile.videoconfavailability != nil
      starttime = self.profile.videoconfavailability.time.to_f
      endtime = (starttime + (60*60)).to_f
      duration = (Time.now - starttime)
      time = Time.now

      starttime <= time.to_f && endtime >= starttime && self.profile.videoconfavailability.time.day == time.day

  end


end
