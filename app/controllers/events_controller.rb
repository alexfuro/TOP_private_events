class EventsController < ApplicationController
  before_action :logged_in?, except: [:index, :show]

  def index
    @events = Event.all
  end

  def new
    @event = Event.new()
  end

  def create
    user = User.find(session[:id])
    @event = user.hostings.build(event_params)
    if @event.save
      flash[:success] = "Event created!"
      redirect_to user
    else
      flash[:danger] = "Event was not created!"
      render 'new'
    end
  end

  def show
    @event = Event.find(params[:id])
    @attendance = @event.attendances.build(attendee_id: session[:id])
    @hosting = hosting?
    @attending = attending?
  end

  private
    def event_params
      params.require(:event).permit(:description, :location, :event_date)
    end

    def logged_in?
      redirect_to new_session_path if session[:id].nil?
    end

    def hosting?
      @event.creator_id == session[:id]
    end

    def attending?
      @event.attendees.pluck(:attendee_id).include?(session[:id])
    end
end
