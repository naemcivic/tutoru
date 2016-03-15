class Profile < ActiveRecord::Base
  require 'Date'

  belongs_to :user
  mount_uploader :avatar, AvatarUploader
  geocoded_by :location
  after_validation :geocode, if: :location_changed?

  def convert_km
    (distance * 1.61).round(2)
  end

  #display availability in an array
  def display_availability
    if self.availability == ""
      self.availability = "Not Available"
    else
      self.availability = availability.split(",")
    end
  end

  #method to remove date from tutor's availability
  def delete_availability(appointmentdate,profile_date)
    availability_split = profile_date.split(",")
     deleted_date = availability_split.delete_if {|date| date == appointmentdate}
     self.availability = deleted_date.join(",")
     return
  end




  #method to display upvote in the user#inde
  def display_upvote
    User.find(self.user_id).get_upvotes.size
  end

  #method to display downvote in the user#index
  def display_downvote
    User.find(self.user_id).get_downvotes.size
  end

end
