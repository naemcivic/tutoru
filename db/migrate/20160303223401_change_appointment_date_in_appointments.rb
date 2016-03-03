class ChangeAppointmentDateInAppointments < ActiveRecord::Migration
  def change
    change_column :appointments, :appointment_date, :text
  end
end
