class EventsController < ApplicationController
  # this function shows the events/new page.
  def new
  end
  
  def index
    @events = Event.all
	
  end
  
  # this function is for creating new event based on Event Model.
  def create
    # creates the event.
    @event = Event.new(event_params)

    # save to database.
    @event.save
    # redirects to main page.
    redirect_to :controller => 'calendars', action: 'index'
  end
  
  def show
    @event = Event.find(params[:id])
  end
  
  def update
	
    @event = Event.find(params[:id])
	if @event.update_attribute(params[:event])
		redirect_to events_path, :notice => "Updated"
	else
		render "edit"
	end
  end
  
  def save
  
    @event = Event.find(params[:id])
	#save a button
	@event.save
    # redirects to main page.
  end
  
  # this function allows to delete events.
  # this function shows in the events/id#/edit.
  def edit
    @event = Event.find(params[:id])
  end

  # this function goes with edit and destroys event.
  def destroy
    @event = Event.find(params[:id])
    @event.destroy

    redirect_to :controller => 'calendars', action: 'index'
  end
  
  
  # this function takes requirements for what create function should take in
  private def event_params
    params.require(:event).permit(:title, :start_time, :start_meridian, :end_time, :end_meridian)
  end
end
