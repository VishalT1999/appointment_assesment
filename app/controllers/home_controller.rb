class HomeController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @appointments = Appointment.filter_doctor(current_user)
    if current_user.doctor?
      @list_data = Appointment.includes(:user).where(user_id: current_user.id).group('DATE(appointments.slot)').count
    end
  end
end
