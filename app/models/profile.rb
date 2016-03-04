class Profile < ActiveRecord::Base
  belongs_to :user

  def to_array
    availability.split(",")
  end
end
