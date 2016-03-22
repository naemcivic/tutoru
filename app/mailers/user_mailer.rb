class UserMailer < ApplicationMailer

  def welcome_email(user)
    @user = user
    mail(to: @user.email , subject: "Welcome to TutorU")
  end

  def student_appointment(student,appointment,tutor)
    @user = student
    @appointment = appointment
    @tutor = tutor
    mail(to: @user.email, subject: "Appointment created on TutorU with our tutor")
  end

  def tutor_appointment(student,appointment,tutor)
    @user = student
    @appointment = appointment
    @tutor = tutor
    mail(to: @tutor.email, subject: "Appointment created on TutorU with our student")
  end



end
