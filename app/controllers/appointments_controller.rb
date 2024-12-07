class AppointmentsController < ApplicationController
	before_action :authenticate_user!

	def new
		@appointment = Appointment.new
	end

	def create
		@appointment = Appointment.new(appointment_params)
    if @appointment.save
      redirect_to root_url, notice: 'Appointment was successfully created.'
    else
      render :new 
    end
	end

	def edit
		@appointment = Appointment.find_by(id: params[:id])
	end

	def update
		@appointment = Appointment.find_by(id: params[:id])

    if @appointment.update(appointment_params)
      redirect_to root_url, notice: 'Appointment was successfully updated.'
    else
      render :edit
    end
	end

	def destroy
		@appointment = Appointment.find_by(id: params[:id])
    @appointment.destroy
    redirect_to root_url, notice: 'Appointment was successfully deleted.'
	end

	private

	def appointment_params
    params.require(:appointment).permit(:user_id, :slot, :patient_name, :patient_number, :address)
  end
end
