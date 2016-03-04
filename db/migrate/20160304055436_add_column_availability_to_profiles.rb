class AddColumnAvailabilityToProfiles < ActiveRecord::Migration
  def change
    add_column :profiles, :availability, :text, array:true, default: []
  end
end
