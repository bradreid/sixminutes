class Projects::Tasks::EventsController < ApplicationController
  before_filter :authenticate_user!  
  
  def new
    @project = Project.find(params[:project_id])
    @task = @project.tasks.find(params[:task_id])
    @event = @task.events.build(:name => @task.name, :user => current_user)
    if @event.save
      redirect_to root_path
    else
      render 'projects/show'
    end
  end

end
