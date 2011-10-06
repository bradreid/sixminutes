class Projects::TasksController < ApplicationController
  before_filter :authenticate_user!  
  
  def new
    @project = Project.find(params[:project_id])
    @task = @project.tasks.build
  end
  
  def create
    @project = Project.find(params[:project_id])
    @task = @project.tasks.build(params[:task])
    if @task.save
      flash[:notice] = "You sucessfully created a new task"
      redirect_to project_path(@project)
    else
      render 'new'
    end
  end
  
  def destroy
    @project = Project.find(params[:project_id])
    @task = @project.tasks.find(params[:id])
    @task.destroy
    flash[:notice] = "You sucessfully deleted a task"
    redirect_to project_path(@project)    
  end
end
