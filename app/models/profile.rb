class Profile < ActiveRecord::Base
  belongs_to :user
  mount_uploader :avatar, AvatarUploader
  geocoded_by :location
  after_validation :geocode, if: :location_changed?

  def to_array
    availability.split(",")
  end
end
