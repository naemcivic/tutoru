class AddColProfiles < ActiveRecord::Migration
  def change
    add_column :profiles, :availability, :text
  end
end
