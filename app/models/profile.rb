class Profile < ActiveRecord::Base
  belongs_to :user
  mount_uploader :avatar, AvatarUploader
  geocoded_by :location
  after_validation :geocode, if: :location_changed?

  def convert_km
    (distance * 1.61).round(2)
  end


  def to_array
    availability.split(",")
  end
end
