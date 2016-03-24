class Profile < ActiveRecord::Base
  belongs_to :user
  mount_uploader :avatar, AvatarUploader
  geocoded_by :location
  after_validation :geocode, if: :location_changed?

  def display_time_to_video_conf
    videoconfavailability.strftime("%I:%M %p")
  end

  def time_to_video
    (((self.videoconfavailability - Time.now.to_datetime) / 60) / 60).round(0)
  end

  def update_availability(appointmentdate, profiledate)
    if self.availability == appointmentdate
      self.availability = nil
    else
      self.availability
    end
  end

  #a method to format availability in tutor's profile
  def tutor_availability
    self.availability.strftime('%A %b %d, %Y %I:%M %P')
  end


  def video_availability
    self.videoconfavailability.strftime('%A %b %d, %Y %I:%M %P')
  end

  #a method to show the tutor's distance in KMs
  def convert_km
    (distance * 1.61).round(2)
  end

  #method to display upvote in the user#index
  def display_upvote
    User.find(self.user_id).get_upvotes.size
  end

  #method to display downvote in the user#index
  def display_downvote
    User.find(self.user_id).get_downvotes.size
  end

end
