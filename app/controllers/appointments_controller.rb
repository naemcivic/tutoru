class AppointmentsController < ApplicationController
  before_action :load_user
  before_action :require_login, only: [:create,:destroy]

  def index
  end

  def show
  end

  def new
  end

  def create
    @appointment = @user.student_appointments.build(appointment_params)
    tutorid = @appointment.tutor_id
    tutor = User.find(tutorid)
    @tutor = tutor
    respond_to do |format|
      if @appointment.available?(@appointment.appointment_date, tutor.profile.availability)
         @tutor.profile.delete_availability(@appointment.appointment_date, @tutor.profile.availability)
         @tutor.save
         @appointment.save
      format.html { redirect_to root_path, notice: 'Appointment made'}
        format.js {}
      else
        format.html { render root_path, alert: 'Try again'}
        format.js {}
      end
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end


  private
  def appointment_params
    params.require(:appointment).permit(:appointment_date,:student_id,:tutor_id, :user_id)
  end

  def load_user
    @user = current_user
  end

end
