class ChangeColumnTypeProfiles < ActiveRecord::Migration
  def change
    change_column :profiles, :availability, :text
  end
end
