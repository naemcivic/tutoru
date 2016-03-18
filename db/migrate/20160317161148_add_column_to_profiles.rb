class AddColumnToProfiles < ActiveRecord::Migration
  def change
      add_column :profiles, :availability, :datetime
  end
end
