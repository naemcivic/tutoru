class Profile < ActiveRecord::Base
  require 'date'
  belongs_to :user
  mount_uploader :avatar, AvatarUploader
  geocoded_by :location
  after_validation :geocode, if: :location_changed?

  #a method to format availability in tutor's profile
  def tutor_availability
    self.availability.to_datetime.strftime('%A %b %d, %Y %I:%M %P')
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
