class RemoveAppointmentDateFromAppointments < ActiveRecord::Migration
  def change
    remove_column :appointments, :appointment_date, :text
  end
end
