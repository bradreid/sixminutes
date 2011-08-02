class EventsController < ApplicationController
  respond_to :html, :json
  
  def index
    @events = Event.order("id desc")
  end
  
  def update
    @event = Event.find(params[:id])
    @event.update_attributes(params[:event])
    respond_with @event
  end  
  
  def create
    @event = Event.new(params[:event])
    @event.save  
    respond_with @event
  end

end
