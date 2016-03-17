class Profile < ActiveRecord::Base
  belongs_to :user
  mount_uploader :avatar, AvatarUploader
  geocoded_by :location
  after_validation :geocode, if: :location_changed?

  def convert_km
    (distance * 1.61).round(2)
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
