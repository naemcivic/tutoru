class AddViedoConfAvailabilityToProfiles < ActiveRecord::Migration
  def change
    add_column :profiles, :videoconfavailability, :datetime
  end
end
