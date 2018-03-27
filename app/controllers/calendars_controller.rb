class CalendarsController < ApplicationController
  # this function is for the root page
  
  def index
    @events = Event.all
    @days = ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"]
    @times = ["12:00 am", "1:00 am", "2:00 am", "3:00 am", "4:00 am", "5:00 am", "6:00 am", "7:00 am", "8:00 am", "9:00 am", "10:00 am", "11:00 am", "12:00 pm", "1:00 pm", "2:00 pm", "3:00 pm", "4:00 pm", "5:00 pm", "6:00 pm", "7:00 pm", "8:00 pm", "9:00 pm", "10:00 pm", "11:00 pm"]
	@week = 2
  
  end
  
  def addweek
    @week = @week + 1
    redirect_to :controller => 'calendars', action: 'index'
  end
  
  def subweek
    @week = @week - 1
    redirect_to :controller => 'calendars', action: 'index'
  end
  
  
  
end