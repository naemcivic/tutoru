class Profile < ActiveRecord::Base
  belongs_to :user
  mount_uploader :avatar, AvatarUploader

  def to_array
    availability.split(",")
  end
end
