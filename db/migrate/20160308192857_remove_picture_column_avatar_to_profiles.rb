class RemovePictureColumnAvatarToProfiles < ActiveRecord::Migration
  def change
    remove_column :profiles, :picture, :text
  end
end
