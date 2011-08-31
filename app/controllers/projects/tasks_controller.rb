class Projects::TasksController < ApplicationController
  before_filter :authenticate_user!  
  
  def index
    @tasks = current_user.projects.find(params[:project_id]).tasks
  end
end
