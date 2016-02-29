class ChangeNames < ActiveRecord::Migration
  def change
    rename_column :appointments, :appointment, :appointment_date
  end
end
