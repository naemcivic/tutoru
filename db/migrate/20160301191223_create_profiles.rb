class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.date :availability
      t.string :picture
      t.text :qualification
      t.string :category
      t.text :location
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
