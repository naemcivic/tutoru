class AddStudentAndTutorToAppointments < ActiveRecord::Migration
  def change
    add_reference :appointments, :student, index: true
    add_reference :appointments, :tutor, index: true

    add_foreign_key :appointments, :users, column: :student_id
    add_foreign_key :appointments, :users, column: :tutor_id
  end
end
