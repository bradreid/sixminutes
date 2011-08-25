class ProjectsController < ApplicationController
  before_filter :authenticate_user!  
  
  def index
    @projects = current_user.projects.order('id desc')
  end
  
  def new
    @project = Project.new
  end
  
  def create
    @project = Project.new(params[:project].merge(:user => current_user))
    if @project.save
      flash[:notice] = "Project was created successfully."
      redirect_to projects_path
    else
      render 'new'
    end
  end
  
  def show
    @project = current_user.projects.find(params[:id])
  end
  
  def edit
    @project = current_user.projects.find(params[:id])    
  end
  
  def update
    @project = current_user.projects.find(params[:id])
    if @project.update_attributes(:params[:project])
      flash[:notice] = "Project was successfully updated."
      redirect_to project_path(@project)
    else
      render 'edit'
    end
  end
end
