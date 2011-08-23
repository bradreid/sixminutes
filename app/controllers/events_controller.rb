class EventsController < ApplicationController
  respond_to :html, :json
  
  def index
    @events = Event.order("id desc")
    if current_user    
      @events = @events.where(:user_id => current_user) 
    else
      @events = @events.where("user_id is null")
    end
  end
  
  def update
    @event = current_user ? current_user.events.find(params[:id]) : Event.find(params[:id])
    @event.update_attributes(params[:event])
    respond_with @event
  end  
  
  def create
    @event = Event.new(params[:event].merge(:user => current_user))
    @event.save  
    respond_with @event
  end

end
