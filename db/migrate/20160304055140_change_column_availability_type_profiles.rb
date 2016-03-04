class ChangeColumnAvailabilityTypeProfiles < ActiveRecord::Migration
  def change
    remove_column :profiles, :availability, :text, array:true, default: []
  end
end
