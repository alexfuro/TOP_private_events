class AttendancesController < ApplicationController
  def new
  end
  def create
    @attendance = Attendance.new(attendance_params)
    if @attendance.save
      flash[:success] = "Your attendance was taken"
      redirect_to event_path(params[:attendance][:attended_event_id])
    else
      flash.now[:danger] = "Oh no! Something went wrong!"
      render event_path(params[:attendance][:attended_event_id])
    end
  end

  private
    def attendance_params
      params.require(:attendance).permit(:attendee_id,:attended_event_id)
    end
end
