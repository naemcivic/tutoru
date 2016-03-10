class ChangeColumnLocationTypeProfiles < ActiveRecord::Migration
  def change
    change_column :profiles, :location, :string
  end
end
