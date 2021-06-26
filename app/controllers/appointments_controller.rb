class AppointmentsController < ApplicationController
  before_action :set_appointment, only: [:show, :update, :destroy]
    
  # GET /appointments
  def index
    @appointments = Appointment.where("user_1_id" == current_user || "user_1_id" == current_user )
    render json: @appointments, include: [:user_1, :user_2] 
  end

  # GET /appointments/1
  def show
    render json: @appointment
  end

  # POST /appointments
  def create
    @appointment = Appointment.new(appointment_params)
    @appointment.user_1 = current_user

    if @appointment.save
      render json: @appointment, status: :created, location: @appointment
    else
      render json: @appointment.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /appointments/1
  def update
    if @appointment.update(appointment_params)
      render json: @appointment
    else
      render json: @appointment.errors, status: :unprocessable_entity
    end
  end

  # DELETE /appointments/1
  def destroy
    @appointment.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_appointment
      @appointment = Appointment.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def appointment_params
      params.require(:appointment).permit(:user_2_id, :title, :date, :appointment_time, :validated)
    end
end